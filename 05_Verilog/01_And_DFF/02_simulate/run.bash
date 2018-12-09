#!/bin/bash
cp -rf ./../01_design/* ./run/
cp -rf ./testbench/* ./run
cd run
vcs -R -debug_all *.v
cd ..
