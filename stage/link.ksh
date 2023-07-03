#!/bin/bash 

#set -euax



data=/scratch2/BMC/zrtrr/hlin/data



#yymm=202107
#for dd in  18 19 20 21 22 23 24 25 26 27 28 29 30 31
#do
   #ln -sf  ${data}/obs_rap/${yymm}${dd}* obs_rap
#   ln -sf ${data}/reflectivity/*${yymm}${dd}* reflectivity
#done


# 132: 05/12/21      144: 05/24/21   199: 07/18/2021
for dd in 199 200 201 202 203 204 205 206 207 208 209 210 211 212 213 #199 200 201
do

  #ln -sf  ${data}/gfs/0p25deg/grib2/21${dd}* gfs/0p25deg/grib2 
  #ln -sf  ${data}/enkf/atm/21${dd}* enkf/atm
  ln -sf ${data}/lightning/vaisala/netcdf/21${dd}* lightning/vaisala/netcdf
 
done

