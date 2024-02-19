/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: David Canright
// Adapted by:
// 
// Create Date: 11/2022
// Module Name: gf_inv_4_masked
// Project Name: aes_sboxes
// Description: Inverse in GF(2^4)/GF(2^2), using normal basis [alpha^8, alpha^2].
//              Adapted from D. Canright's Very Compact S-Box.
// 
// Dependencies: fac_2, gf_muls_2_masked.
// 
// Additional Comments: None.
// 
//////////////////////////////////////////////////////////////////////////////////

module gf_inv_4_masked (
    input   wire  [3:0]  A, 
    input   wire  [3:0]  M, // Input mask
    input   wire  [3:0]  N, // Output mask
    output  wire  [3:0]  Q
  );

  wire [1:0] a, b, m, n, c, cm, e, d, p, q, an, mb, mn, m2, dn, em, pm, qm;
  wire [1:0] csa, csb, cst, qsa, qsb, dm, psa, psb; 
  wire [2:0] af, bf, mf, nf, ef, df; 
  
  assign a = A[3:2];
  assign b = A[1:0];
  assign m = M[3:2];
  assign n = M[1:0];
  assign m2 = N[3:2];  

  fac_2 afac(a, af);
  fac_2 bfac(b, bf);
  fac_2 mfac(m, mf);
  fac_2 nfac(n, nf);

  gf_muls_2_masked anmul(af, nf, an);
  gf_muls_2_masked mbmul(mf, bf, mb);
  gf_muls_2_masked mnmul(mf, nf, mn);
  
  assign cst = {~(a[1] | b[1]) ^ (~(af[2] & bf[2])),
                ~(af[2] | bf[2]) ^ (~(a[0] & b[0]))} ^ m2;

  assign csa = cst ^ an ;
  assign csb = csa ^ mb ;
  assign cm = {m[1] ^ nf[2], mf[2] ^ n[0]} ^ mn ^ m2 ;
  assign c = csb ^ cm ;
  assign e = {c[0], c[1]};

  fac_2 efac(e, ef);
  gf_muls_2_masked  qmul(ef, af, q);
  gf_muls_2_masked emmul(ef, mf, em);

  assign qsa = N[1:0] ^ an ;  
  assign qsb = qsa ^ em ;    
  assign qm = qsb ^ mn ;     

  assign dm = m ^ n;  
  assign d =  e ^ dm; 

  fac_2 dfac(d, df);
  gf_muls_2_masked  pmul(df, bf, p);
  gf_muls_2_masked dnmul(df, nf, dn);

  assign psa = N[3:2] ^ mb ; 
  assign psb = psa ^ dn ;    
  assign pm = psb ^ mn;
  assign Q = { (pm ^ p), (qm ^ q) };

endmodule // gf_inv_4_masked