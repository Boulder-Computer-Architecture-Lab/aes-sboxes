#!/usr/bin/env python3

import os
from pathlib import Path
import cocotb
from cocotb.runner import get_runner

proj_path = Path(__file__).resolve().parent
sim = os.getenv("SIM", "ghdl")

def test_sbox_merged_full_lut_verilog():
    ''' S-Box Full Lut'''
    runner = get_runner(sim)
    runner.build(
        vhdl_sources=[proj_path / "vhdl/merged/sbox_full_lut/sbox_full_lut.vhd"],
        verilog_sources=[],
        hdl_toplevel="sbox_full_lut",
        always=True,
    )
    runner.test(hdl_toplevel="sbox_full_lut", test_module="test_merged,")
   
def test_sbox_merged_new_area_verilog():
    ''' S-Box New Area Verilog.'''
    runner = get_runner(sim)
    runner.build(
        vhdl_sources=[proj_path / "vhdl/merged/sbox_new_area/sbox_new_area.vhd",
                         proj_path / "vhdl/merged/sbox_new_area/out_mult.vhd",
                         proj_path / "vhdl/merged/sbox_new_area/exp.vhd",
                         proj_path / "vhdl/merged/sbox_new_area/subfield_inv.vhd",
                         proj_path / "vhdl/merged/sbox_new_area/tr_in.vhd",
                         proj_path / "vhdl/merged/sbox_new_area/tr_out.vhd"],
        verilog_sources=[],
        hdl_toplevel="sbox_new_area",
        always=True,
    )
    runner.test(hdl_toplevel="sbox_new_area", test_module="test_merged,")