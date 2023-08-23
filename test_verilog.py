#!/usr/bin/env python3

import os
from pathlib import Path
import cocotb
from cocotb.runner import get_runner

proj_path = Path(__file__).resolve().parent
sim = os.getenv("SIM", "icarus")

def test_sbox_full_lut_verilog():
    ''' S-Box Full Lut'''
    runner = get_runner(sim)
    runner.build(
        verilog_sources=[proj_path / "verilog/sbox_full_lut/sbox_full_lut.v"],
        vhdl_sources=[],
        hdl_toplevel="sbox_full_lut",
        always=True,
    )
    runner.test(hdl_toplevel="sbox_full_lut", test_module="test_sbox,test_invsbox")
   
def test_sbox_inv_lut_verilog():
    ''' S-Box Inverse Lut'''
    runner = get_runner(sim)
    runner.build(
        verilog_sources=[proj_path / "verilog/sbox_inv_lut/sbox_inv_lut.v",
                         proj_path / "verilog/common/affine_transform.v",
                         proj_path / "verilog/common/invaffine_transform.v"],
        vhdl_sources=[],
        hdl_toplevel="sbox_inv_lut",
        always=True,
    )
    runner.test(hdl_toplevel="sbox_inv_lut", test_module="test_sbox,test_invsbox")

def test_new_area_verilog():
    ''' S-Box New Area Verilog.'''
    runner = get_runner(sim)
    runner.build(
        verilog_sources=[proj_path / "verilog/sbox_new_area/sbox_new_area.v",
                         proj_path / "verilog/sbox_new_area/out_mult.v",
                         proj_path / "verilog/sbox_new_area/exp.v",
                         proj_path / "verilog/sbox_new_area/subfield_inv.v",
                         proj_path / "verilog/sbox_new_area/tr_in.v",
                         proj_path / "verilog/sbox_new_area/tr_out.v"],
        vhdl_sources=[],
        hdl_toplevel="sbox_new_area",
        always=True,
    )
    runner.test(hdl_toplevel="sbox_new_area", test_module="test_sbox,test_invsbox")
    
def test_canright_verilog():
    ''' Test for Canright's S-Box in Verilog.'''
    runner = get_runner(sim)
    runner.build(
        verilog_sources=[proj_path / "verilog/canright/sbox_canright.v",
                         proj_path / "verilog/canright/gf_inv_4.v",
                         proj_path / "verilog/canright/gf_inv_8.v",
                         proj_path / "verilog/canright/gf_muls_2.v",
                         proj_path / "verilog/canright/gf_muls_4.v",
                         proj_path / "verilog/canright/gf_muls_scl_2.v",
                         proj_path / "verilog/canright/gf_sq_2.v"],
        vhdl_sources=[],
        hdl_toplevel="sbox_canright",
        always=True,
    )
    runner.test(hdl_toplevel="sbox_canright", test_module="test_sbox,test_invsbox")
    
def test_depth16_verilog():
    ''' Test for the Depth-16 S-Box in Verilog.'''
    runner = get_runner(sim)
    runner.build(
        verilog_sources=[proj_path / "verilog/depth16/bottom_linear_forward.v",
                         proj_path / "verilog/depth16/bottom_linear_reverse.v",
                         proj_path / "verilog/depth16/middle_nonlinear_shared.v",
                         proj_path / "verilog/depth16/sbox_depth16.v",
                         proj_path / "verilog/depth16/top_linear_forward.v",
                         proj_path / "verilog/depth16/top_linear_reverse.v"],
        vhdl_sources=[],
        hdl_toplevel="sbox_depth16",
        always=True,
    )
    runner.test(hdl_toplevel="sbox_depth16", test_module="test_sbox,test_invsbox")
    
def test_pprm_verilog():
    ''' Test for the PPRM S-Box in Verilog.'''
    runner = get_runner(sim)
    runner.build(
        verilog_sources=[proj_path / "verilog/pprm/pprm_inverter.v",
                         proj_path / "verilog/pprm/pprm_stage_1.v",
                         proj_path / "verilog/pprm/pprm_stage_2.v",
                         proj_path / "verilog/pprm/sbox_pprm.v",
                         proj_path / "verilog/common/affine_transform.v",
                         proj_path / "verilog/common/invaffine_transform.v",
                         proj_path / "verilog/pprm/pprm_stage_3.v"],
        vhdl_sources=[],
        hdl_toplevel="sbox_pprm",
        always=True,
    )
    runner.test(hdl_toplevel="sbox_pprm", test_module="test_sbox,test_invsbox")
    
def test_pprm_inverter_verilog():
    ''' Test for the Logarithmic S-Box in Verilog.'''
    runner = get_runner(sim)
    runner.build(
        verilog_sources=[proj_path / "verilog/pprm/pprm_inverter.v",
                         proj_path / "verilog/pprm/pprm_stage_1.v",
                         proj_path / "verilog/pprm/pprm_stage_2.v",
                         proj_path / "verilog/pprm/pprm_stage_3.v"],
        vhdl_sources=[],
        hdl_toplevel="pprm_inverter",
        always=True,
    )
    runner.test(hdl_toplevel="pprm_inverter", test_module="test_inverter,")

# def test_sbox_log_lut_verilog():
#     ''' Test for the Logarithmic S-Box in Verilog.'''
#     runner = get_runner(sim)
#     runner.build(
#         verilog_sources=[proj_path / "verilog/sbox_log_lut/log_inverter.v",
#                          proj_path / "verilog/sbox_log_lut/sbox_log_lut.v",
#                          proj_path / "verilog/common/affine_transform.v",
#                          proj_path / "verilog/common/invaffine_transform.v"],
#         vhdl_sources=[],
#         hdl_toplevel="sbox_log_lut",
#         always=True,
#     )
#     runner.test(hdl_toplevel="sbox_log_lut", test_module="test_sbox,test_invsbox")
    
# def test_log_inverter_verilog():
#     ''' Test for the Logarithmic S-Box in Verilog.'''
#     runner = get_runner(sim)
#     runner.build(
#         verilog_sources=[proj_path / "verilog/sbox_log_lut/log_inverter.v"],
#         vhdl_sources=[],
#         hdl_toplevel="log_inverter",
#         always=True,
#     )
#     runner.test(hdl_toplevel="log_inverter", test_module="test_inverter,")

