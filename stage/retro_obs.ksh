#!/bin/bash 

set -ux

date
echo " start copy "

dd=`date "+%Y%m%d" --date="1 days ago"`
echo $dd

ddjul=`date "+%j" --date="1 days ago"`
echo $ddjul

data=/scratch2/BMC/zrtrr/rli/data


#-------#
# 05/21 #
#-------#

# hpss: /BMC/fdr/Permanent/2021/05/15/grib/ftp_rap_hyb/7/0/105/0_794802_32769
#rap_data=/public/data/grids/rap/full/wrfnat/grib2
#cp ${rap_data}/21${ddjul}* ${data}/rap/full/wrfnat/grib2


# hpss: /BMC/fdr/Permanent/2021/05/11/grib/hrrr_wrfnat/7/0/83/0_1905141_30
#hrrr_data=/public/data/grids/hrrr/conus/wrfnat/grib2/
#cp ${hrrr_data}/21${ddjul}*00 ${data}/hrrr/conus/wrfnat/grib2


#-------#
# 02/22 #
#-------#

# hpss: /BMC/fdr/Permanent/2021/05/11/data/grids/rap/obs
cp /scratch2/BMC/public/data/grids/rap/obs/${dd}*.rap.*  ${data}/obs_rap
cp /scratch2/BMC/public/data/grids/rap/obs/${dd}*.rap_e*  ${data}/obs_rap


lightning_data=/scratch2/BMC/public/data/lightning/vaisala/netcdf
cp ${lightning_data}/22${ddjul}* ${data}/lightning/vaisala/netcdf


# hpss: /BMC/fdr/Permanent/2021/07/18/grib/gfs_full/7/0/96/0_259920_0    3 hourly fcst 0.5 deg
# hpss: /BMC/fdr/Permanent/2021/07/01/grib/ftp/7/0/96/0_1038240_0          hourly fcst 0.25 deg, 
# diff hourly 0.25deg data from hpss and one from Hhera, same.
gfs_data=/scratch2/BMC/public/data/grids/gfs/0p25deg/grib2
cd ${gfs_data}
for file in `ls 22${ddjul}*`
do
   hr=10#$(echo $file|cut -c 11-13)
   if [[ $hr -le 96 ]]; then
      cp $file ${data}/gfs/0p25deg/grib2
   fi
done


#/NCEPPROD/5year/hpssprod/runhistory/rhYYYY/YYYYMM/YYYYMMDD/com_gfs_prod_enkfgdas.YYYYMMDD_HH.enkfgdas_grp[1-8].tar
enkf_path=/scratch1/NCEPDEV/rstprod/com/gfs/prod
cd ${data}/enkf/atm
for hh in 00 06 12 18; do

  JDATE=`date -d  "${dd} ${hh}" +%y%j%H00`
  echo ${dd} ${hh} $JDATE

  dir=enkfgdas.${dd}/${hh}/atmos
  mkdir -p ${dir}
  cp -r ${enkf_path}/${dir}/mem* ./${dir}
  rm ./${dir}/mem*/gdas*atmf006.nc
  rm ./${dir}/mem*/gdas*ratminc.nc

  #make links
  for k in $(seq -w 1 80); do
    ln -sf ./${dir}/mem0${k}/gdas.t${hh}z.atmf009.nc ${JDATE}.gdas.t${hh}z.atmf009.mem0${k}.nc     # 2021
  done

done

date
echo "end copy "

