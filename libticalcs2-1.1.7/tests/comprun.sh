#!/bin/sh
cd ..
make
cd tests/
# Pour tester, enlever le # :
sudo ./test_ticalcs_2 Lua3D.tns MyLib
