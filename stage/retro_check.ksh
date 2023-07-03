#!/bin/bash 

#set -euax


data=/scratch2/BMC/zrtrr/rli/data


yy=22

# 132: 05/12/21      144: 05/24/21  199: 07/18/2021 212: 07/31/2021, 032: 02/01/22
#for dd in 032 033 034 035 036 037 038 039 040 041 042 043 044 045 046 047 048 049
#for dd in 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151

for dd in 187 188 189 190 191 192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207 208 209 210 211 212 213 214 215 216 217
do
  #num=`ls ${data}/rap/full/wrfnat/grib2/21${dd}*       | wc`
  #echo "${dd} rap_bdy " $num 
  #num=`ls ${data}/hrrr/conus/wrfnat/grib2/21${dd}*00  | wc`
  #echo "${dd} hrrr " $num 

  num=`ls ${data}/gfs/0p25deg/grib2/${yy}${dd}*           | wc`
  echo "${dd} gfs_fcst " $num 

  num=`ls ${data}/lightning/vaisala/netcdf/${yy}${dd}*    | wc`
  echo "${dd} lighting" $num

  num=`ls ${data}/enkf/atm/${yy}${dd}*                    | wc`
  echo "${dd} gfs_ensemble_ln" $num

  echo ''
done


yymm=202207
#for dd in  01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
for dd in   07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 
do

  yymmdd=${yymm}${dd}
    
  num=`ls  ${data}/enkf/atm/enkfgdas.${yymmdd}/*/atmos/mem*/gdas.t*z.atmf009.nc | wc`
  echo "${yymmdd} gfs_ensemble" $num

  num=`ls ${data}/obs_rap/${yymmdd}*rap_e.*               |wc`
  echo "${yymmdd} rap_e" $num

  num=`ls ${data}/obs_rap/${yymmdd}*rap.*          |wc`
  echo "${yymmdd} rap_obs" $num

  num=`ls ${data}/reflectivity/*${yymmdd}-*.grib2 |wc`
  echo "${yymmdd} reflectivity" $num

  echo ''

done

exit


yymm=202208
for dd in  01 02 03 04 05 
do

  yymmdd=${yymm}${dd}

  num=`ls  ${data}/enkf/atm/enkfgdas.${yymmdd}/*/atmos/mem*/gdas.t*z.atmf009.nc | wc`
  echo "${yymmdd} gfs_ensemble" $num

  #num=`ls ${data}/obs_rap/${yymmdd}*rap_e.*               |wc`
  #echo "${yymmdd} rap_e" $num

  #num=`ls ${data}/obs_rap/${yymmdd}*rap.*          |wc`
  #echo "${yymmdd} rap_obs" $num

  num=`ls ${data}/reflectivity/*${yymmdd}-*.grib2 |wc`
  echo "${yymmdd} reflectivity" $num

  echo ''

done

