#!/bin/bash

zstart=-44
zend=44
ss=2

for ((z=$zstart;z<=$zend;z+=$ss));do
    cp launch_temp launch_temp_${z}
    sed -i "s/name=test/name=sp_${z}/g" launch_temp_${z}
    sed -i "s/z=0/z=${z}/g" launch_temp_${z}
    sbatch launch_temp_${z}
done 
