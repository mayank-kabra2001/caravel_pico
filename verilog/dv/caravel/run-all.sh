#!/bin/sh

for x in `ls -d */` ; do cd $x ; SIM=RTL    make  2>&1 | tee -a verify-rtl.log    ; grep Monitor verify-rtl.log    ; done
for x in `ls -d */` ; do cd $x ; SIM=GL     make  2>&1 | tee -a verify-gl.log	  ; grep Monitor verify-gl.log     ; done
for x in `ls -d */` ; do cd $x ; SIM=GL_SDF make  2>&1 | tee -a verify-gl-sdf.log ; grep Monitor verify-gl-sdf.log ; done
