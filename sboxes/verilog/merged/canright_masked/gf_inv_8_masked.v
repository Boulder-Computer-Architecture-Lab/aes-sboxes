/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: David Canright
// Editor: Phaedra Curlin
// 
// Create Date: 11/2022
// Module Name: gf_inv_8_masked
// Project Name: aes-sboxes
// Description: Inverse in GF(2^8)/GF(2^4), using normal basis [d^16, d].
//              Adapted from D. Canright's Very Compact S-Box.
// 
// Dependencies: fac_4, gf_muls_4_masked.
// 
// Revision:
// Revision 0.01 - File Created
// 
// Additional Comments: None.
// 
//////////////////////////////////////////////////////////////////////////////////

module gf_inv_8_masked ( 
        input   wire    [7:0]   A,
        input   wire    [7:0]   M, /* input mask */
        input   wire    [7:0]   N, /* output mask */
        output  wire    [7:0]   Q
    );

    wire   [3:0] a, b, m, n, o, c, d, e, p, q, m4, an, mb, mn, dn, em, pm, qm;
    wire   [3:0] csa, csb, cst, csm, qsa, qsb, psa, psb; /* partial sums */
    wire   [8:0] af, bf, mf, nf, ef, df;  /* factors w/ bit sums */
    wire c1, c2, c3;   /* for temp var */
    
    assign a = A[7:4];
    assign b = A[3:0];
    assign m = M[7:4];
    assign n = M[3:0];
    assign m4 = N[7:4];
    assign o = m ^ n;  /* to switch masks below; has useful bits */
    fac_4 afac(a, af);
    fac_4 bfac(b, bf);
    fac_4 mfac(m, mf);
    fac_4 nfac(n, nf);
    gf_muls_4_masked anmul(af, nf, an);
    gf_muls_4_masked mbmul(mf, bf, mb);
    gf_muls_4_masked mnmul(mf, nf, mn);
    // YO! NEED TO DO SUMMATION BELOW IN SEQUENTIAL ORDER FOR SECURITY !!!!
    /* optimize section below using NOR gates */
    assign c1 = ~(af[5] & bf[5]);
    assign c2 = ~(af[6] & bf[6]);
    assign c3 = ~(af[8] & bf[8]);
    assign cst = {   /* note: ~| syntax for NOR won't compile */
      (~(af[6] | bf[6]) ^ (~(a[3] & b[3]))) ^ c1 ^ c3 ,
      (~(af[7] | bf[7]) ^ (~(a[2] & b[2]))) ^ c1 ^ c2 ,
      (~(af[2] | bf[2]) ^ (~(a[1] & b[1]))) ^ c2 ^ c3 ,
      (~(a[0] | b[0]) ^ (~(af[2] & bf[2]))) ^ (~(af[7] & bf[7])) ^ c2 }
         ^ m4 ;
    /* end of NOR optimization */
    assign csa = cst ^ an ;
    assign csb = csa ^ mb ;
    assign csm = mn ^ {   /* this includes mask terms only */
      mf[6] ^ nf[6] ,
      mf[7] ^ nf[7] ,
      mf[2] ^ nf[2] ,
      o[0] };
    assign c   = csb ^ csm ;
    gf_inv_4_masked dinv( c, m4, m, d); /* inverse masked by m (hi input mask) */

    fac_4 dfac(d, df);
    gf_muls_4_masked  pmul(df, bf, p);
    gf_muls_4_masked dnmul(df, nf, dn);
    // YO! NEED TO DO SUMMATION BELOW IN SEQUENTIAL ORDER FOR SECURITY !!!!
    assign psa = N[7:4] ^ mb ; /* mask terms for p (hi output) */
    assign psb = psa ^ dn ;    /* mask terms for p (hi output) */
    assign pm  = psb ^ mn ;    /* mask terms for p (hi output) */
    assign e = d ^ o;  /* switch masks: m -> n (lo input mask) */
    fac_4 efac(e, ef);
    gf_muls_4_masked  qmul(ef, af, q);
    gf_muls_4_masked emmul(ef, mf, em);
    // YO! NEED TO DO SUMMATION BELOW IN SEQUENTIAL ORDER FOR SECURITY !!!!
    assign qsa = N[3:0] ^ an ; /* mask terms for q (lo output) */
    assign qsb = qsa ^ em ;    /* mask terms for q (lo output) */
    assign qm  = qsb ^ mn;     /* mask terms for q (lo output) */
    assign Q = { (pm ^ p), (qm ^ q) };

endmodule // gf_inv_8_masked