# A Database for AES and AES S-boxes Implementations

This is a repository containing a database ASIC compatible AES and AES S-box implementations.

To clone the repository and its submodules, run:
```
git clone --recursive https://github.com/Boulder-Computer-Architecture-Lab/aes-sboxes.git
```

## AES Implementations

## S-box Implementations 

| Top Module Name      | S-box?   | InvS-box?| Merged?  | Gate Equivalents | HDL     |
| ---                  | ---      | ---      | ---      | ---              | ---     |
| sbox_calik           | &#10003; |          |          |                  | Verilog | 
| sbox_canright        | &#10003; | &#10003; | &#10003; |                  | Verilog | 
| sbox_masked_canright | &#10003; | &#10003; | &#10003; |                  | Verilog | 
| sbox_depth16         | &#10003; | &#10003; | &#10003; |                  | Verilog | 
| sbox_pprm            | &#10003; | &#10003; | &#10003; |                  | Verilog | 
| sbox_bdd             | &#10003; | &#10003; | &#10003; |                  | Verilog | 
| sbox_full_lut        | &#10003; | &#10003; | &#10003; |                  | Verilog | 
| sbox_inv_lut         | &#10003; | &#10003; | &#10003; |                  | Verilog | 
| sbox_new_area        | &#10003; | &#10003; | &#10003; |                  | Verilog | 


## Notes

Gate equivalents was calculated using...
