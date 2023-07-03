#!/bin/bash
## Download fv3 GDAS 80 ensemble members from HPSS
## Only extract atmf009.nemsio files and make file links according to RAP/HRRR file name conventions.
## Guoqing.Ge 03/25/2020
##---------------------------------------------------


# buidl inx for each file in tar so that you are able to get each one from tar
# htar -Xvf /ESRL/BMC/wrfruc/5year/Ruifang.Li/RRFS_retro_May2021/gfs_20210511-19.tar

for dd in 137 138 139 
do
 for cyc in 00 06 12 18
 do
   for k in $(seq -w 0 96); do
    htar -xvf /ESRL/BMC/wrfruc/5year/Ruifang.Li/RRFS_retro_May2021/gfs_20210511-19.tar gfs/0p25deg/grib2/21${dd}${cyc}0000${k}
   done
 done
done

