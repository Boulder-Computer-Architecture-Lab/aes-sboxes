/////////////////////////////////////////////////////////////////////////////////
//
// Original Author: David Canright
// Adapted by:
// 
// Create Date: 11/2022
// Module Name: gf_inv_8_masked
// Project Name: aes_sboxes
// Description: Inverse in GF(2^8)/GF(2^4), using normal basis [d^16, d].
//              Adapted from D. Canright's Very Compact S-Box.
// 
// Dependencies: fac_4, gf_muls_4_masked.
// 
// Additional Comments: None.
// 
//////////////////////////////////////////////////////////////////////////////////

module gf_inv_8_masked ( 
        input   wire    [7:0]   A,
        input   wire    [7:0]   M, // Input mask
        input   wire    [7:0]   N, // Output mask
        output  wire    [7:0]   Q
    );

    wire   [3:0] a, b, m, n, o, c, d, e, p, q, m4, an, mb, mn, dn, em, pm, qm;
    wire   [3:0] csa, csb, cst, csm, qsa, qsb, psa, psb;
    wire   [8:0] af, bf, mf, nf, ef, df;
    wire c1, c2, c3; 
    
    assign a = A[7:4];
    assign b = A[3:0];
    assign m = M[7:4];
    assign n = M[3:0];
    assign m4 = N[7:4];
    assign o = m ^ n;
    fac_4 afac(a, af);
    fac_4 bfac(b, bf);
    fac_4 mfac(m, mf);
    fac_4 nfac(n, nf);
    gf_muls_4_masked anmul(af, nf, an);
    gf_muls_4_masked mbmul(mf, bf, mb);
    gf_muls_4_masked mnmul(mf, nf, mn);


    assign c1 = ~(af[5] & bf[5]);
    assign c2 = ~(af[6] & bf[6]);
    assign c3 = ~(af[8] & bf[8]);
    assign cst = {(~(af[6] | bf[6]) ^ (~(a[3] & b[3]))) ^ c1 ^ c3,
                  (~(af[7] | bf[7]) ^ (~(a[2] & b[2]))) ^ c1 ^ c2,
                  (~(af[2] | bf[2]) ^ (~(a[1] & b[1]))) ^ c2 ^ c3,
                  (~(a[0] | b[0]) ^ (~(af[2] & bf[2]))) ^ (~(af[7] & bf[7])) ^ c2} ^ m4;

    assign csa = cst ^ an ;
    assign csb = csa ^ mb ;
    assign csm = mn ^ {mf[6] ^ nf[6], mf[7] ^ nf[7], mf[2] ^ nf[2], o[0]};
    assign c = csb ^ csm ;
    gf_inv_4_masked dinv(c, m4, m, d);

    fac_4 dfac(d, df);
    gf_muls_4_masked  pmul(df, bf, p);
    gf_muls_4_masked dnmul(df, nf, dn);

    assign psa = N[7:4] ^ mb ; 
    assign psb = psa ^ dn ;    
    assign pm  = psb ^ mn ;
    assign e = d ^ o; 
    fac_4 efac(e, ef);
    gf_muls_4_masked  qmul(ef, af, q);
    gf_muls_4_masked emmul(ef, mf, em);

    assign qsa = N[3:0] ^ an ;
    assign qsb = qsa ^ em ; 
    assign qm  = qsb ^ mn; 
    assign Q = {(pm ^ p), (qm ^ q)};

endmodule // gf_inv_8_masked