/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: David Canright
// Editor: Phaedra Curlin
// 
// Create Date: 11/2022
// Module Name: gf_inv_4_masked
// Project Name: aes-sboxes
// Description: Inverse in GF(2^4)/GF(2^2), using normal basis [alpha^8, alpha^2].
//              Adapted from D. Canright's Very Compact S-Box.
// 
// Dependencies: fac_2, gf_muls_2_masked.
// 
// Revision:
// Revision 0.01 - File Created
// 
// Additional Comments: None.
// 
//////////////////////////////////////////////////////////////////////////////////

module gf_inv_4_masked (
    input   wire  [3:0]  A,
    input   wire  [3:0]  M, /* input mask */
    input   wire  [3:0]  N, /* output mask */
    output  wire  [3:0]  Q
  );

  wire [1:0] a, b, m, n, c, cm, e, d, p, q, an, mb, mn, m2, dn, em, pm, qm;
  wire [1:0] csa, csb, cst, qsa, qsb, dm, psa, psb; /* partial sums */
  wire [2:0] af, bf, mf, nf, ef, df;  /* factors w/ bit sums */
  
  assign a = A[3:2];
  assign b = A[1:0];
  assign m = M[3:2];
  assign n = M[1:0];
  assign m2 = N[3:2];  // mask for 2-bit sums, indep of M

  fac_2 afac(a, af);
  fac_2 bfac(b, bf);
  fac_2 mfac(m, mf);
  fac_2 nfac(n, nf);

  gf_muls_2_masked anmul(af, nf, an);
  gf_muls_2_masked mbmul(mf, bf, mb);
  gf_muls_2_masked mnmul(mf, nf, mn);
  
  // YO! NEED TO DO SUMMATION BELOW IN SEQUENTIAL ORDER FOR SECURITY !!!!
  /* optimize section below using NOR gates */
  assign cst = {   /* note: ~| syntax for NOR won't compile */
    ~(a[1] | b[1]) ^ (~(af[2] & bf[2])) ,
    ~(af[2] | bf[2]) ^ (~(a[0] & b[0])) }
      ^ m2 ;
  /* end of NOR optimization */
  assign csa = cst ^ an ;
  assign csb = csa ^ mb ;
  assign cm = {   /* this includes mask switch */
    m[1] ^ nf[2] ,
    mf[2] ^ n[0] }
      ^ mn ^ m2 ;
  assign c   = csb ^ cm ;
  assign e = {  /* inverse masked by n (lo input mask) */
    c[0] ,
    c[1] };

  fac_2 efac(e, ef);
  gf_muls_2_masked  qmul(ef, af, q);
  gf_muls_2_masked emmul(ef, mf, em);

  /* NOTE: to maintain masking,
  the output mask N must be added BEFORE p, q are added to other terms */
  // YO! NEED TO DO SUMMATION BELOW IN SEQUENTIAL ORDER FOR SECURITY !!!!

  assign qsa = N[1:0] ^ an ;  /* mask terms for q (lo output) */
  assign qsb = qsa ^ em ;     /* mask terms for q (lo output) */
  assign qm = qsb ^ mn ;      /* mask terms for q (lo output) */
  // YO! NEED TO DO SUMMATION BELOW IN SEQUENTIAL ORDER FOR SECURITY !!!!
  assign dm = m ^ n;  /* mask adjustment */
  assign d =  e ^ dm;  /* switch masks: n -> m (hi input mask) */

  fac_2 dfac(d, df);
  gf_muls_2_masked  pmul(df, bf, p);
  gf_muls_2_masked dnmul(df, nf, dn);

  // YO! NEED TO DO SUMMATION BELOW IN SEQUENTIAL ORDER FOR SECURITY !!!!
  assign psa = N[3:2] ^ mb ; /* mask terms for p (hi output) */
  assign psb = psa ^ dn ;    /* mask terms for p (hi output) */
  assign pm = psb ^ mn;      /* mask terms for p (hi output) */
  assign Q = { (pm ^ p), (qm ^ q) };

endmodule // gf_inv_4_masked