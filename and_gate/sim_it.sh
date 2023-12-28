#!/bin/bash

read -p "Enter the top module file name: " top_m
read -p "Enter the testbench file name: " tb
read -p "Enter the VCD file name " vcd_f
iverilog "$top_m" "$tb"
./a.out
gtkwave "$vcd_f"

