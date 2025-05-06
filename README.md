# AES S-boxes

This repository contains various AES S-box implementations.

To clone the repository and its submodules:

```
git clone https://github.com/Boulder-Computer-Architecture-Lab/aes-sboxes.git --recursive
```

## Structure

`aes/` contains AES implementations sourced from other repositories and can be pulled by using `--recursive` when cloning.

`sboxes/` contains 11 different S-boxes. Additional information is provided by the `README.md` located in each subdirectory.

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

## Citing

To cite this work, please use the following reference:

```
@article{curlin_survey_2025,
author = {Curlin, Phaedra Sophia and Heiges, Jeff and Chan, Calvin and Lehman, Tamara Silbergleit},
title = {A Survey of Hardware-Based AES SBoxes: Area, Performance, and Security},
year = {2025},
issue_date = {September 2025},
publisher = {Association for Computing Machinery},
address = {New York, NY, USA},
volume = {57},
number = {9},
issn = {0360-0300},
doi = {10.1145/3724114},
journal = {ACM Comput. Surv.},
month = apr,
articleno = {229},
numpages = {37}
}
```
