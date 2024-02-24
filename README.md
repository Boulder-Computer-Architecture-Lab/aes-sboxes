# AES S-boxes

This repository contains various AES S-box implementations.

`aes/` contains AES implementations sourced from other repositories.

`sboxes/` contains 10 different S-boxes. Additional information is provided by the `README.md` located in each subdirectory.

Testbenches for each of the sboxes are located in `sboxes/tb`.

```
├── aes
│   └── encrypt
│       ├── NullFresh
│       ├── aes-dom
│       ├── aes-secondorder-guards
│       └── self-synchronized-masking
└── sboxes
    └── verilog
        ├── encrypt
        │   └── calik
        ├── merged
        │   ├── canright
        │   ├── canright_masked
        │   ├── common
        │   ├── depth16
        │   ├── maximov
        │   ├── pprm
        │   ├── sbox_bdd
        │   ├── sbox_full_lut
        │   ├── sbox_inv_lut
        │   └── sbox_new_area
        └── tb
```
