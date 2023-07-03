#!/bin/bash 

set -euax

PATH=$PATH:/home/Ruifang.Li/bin




#-----------------#
# gfs forecast #
#-----------------# 
mkdir -p gfs_tmp
cd gfs_tmp

yy=2022
mm=07

for day in 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
do
  for cyc in 00 06 12 18
  do
    hsi get /BMC/fdr/Permanent//${yy}/${mm}/${day}/grib/ftp/7/0/96/0_1038240_0/${yy}${mm}${day}${cyc}00.zip  
    unzip ${yy}${mm}${day}${cyc}00.zip
  done
done


mm=08

for day in 01 02 03 04 05
do
  for cyc in 00 06 12 18
  do
    hsi get /BMC/fdr/Permanent//${yy}/${mm}/${day}/grib/ftp/7/0/96/0_1038240_0/${yy}${mm}${day}${cyc}00.zip
    unzip ${yy}${mm}${day}${cyc}00.zip
  done
done




exit

#-----------------------#
# lightning observation #
#-----------------------# 

cd lighting_tmp

yy=2021
mm=05

for day in  21 22 23 24 25 26 27 28 29 30 31
do
  for cyc in 00
  do
    hsi get /BMC/fdr/Permanent/${yy}/${mm}/${day}/data/lightning/vaisala/netcdf/${yy}${mm}${day}${cyc}00.zip
    unzip ${yy}${mm}${day}${cyc}00.zip
  done
done



#-----------------#
# rap observation #
#-----------------# 

cd obs_rap_tmp

yy=2021
mm=05

for day in 21 22 23 24 25 26 27 28 29 30 31
do
  for cyc in 00 06 12 18
  do
    hsi get /BMC/fdr/Permanent/${yy}/${mm}/${day}/data/grids/rap/obs/${yy}${mm}${day}${cyc}00.zip                  # 2021 data in one zip file

    # # 2019 data in six zip file for each type, need langley nexrad prepbufr satwnd for RRFS retro 
    #/BMC/fdr/Permanent/2019/02/01/data/grids/rap/langley/   nexrad/    prepbufr/  radiance/  radwnd/    satwnd/  
    unzip ${yy}${mm}${day}${cyc}00.zip
  done
done


#--------------#
# reflectivity
#--------------# 
exp="reflectivity"
cd tmp

yy=2021
mm=05

for dd in 29 30 31
do

 #htar -xvf /NCEPPROD/hpssprod/runhistory/rh${yy}/${yy}${mm}/${yy}${mm}${dd}/dcom_prod_ldmdata_obs.tar ./upperair/mrms/conus/MergedReflectivityQC/MergedReflectivityQC_*_${yy}${mm}${dd}-*.grib2.gz

 # start from July 2022, tar file name changed
 htar -xvf /NCEPPROD/hpssprod/runhistory/rh${yy}/${yy}${mm}/${yy}${mm}${dd}/dcom_ldmdata_obs.tar ./upperair/mrms/conus/MergedReflectivityQC/MergedReflectivityQC_*_${yy}${mm}${dd}-*.grib2.gz
done


exit


#------#
# snow
#------# 

cd snow/ims96/grib2

yy=2021
mm=05

for day in 20 21 22 23 24 25 26 27 28 29 30 31
do
  hsi get /BMC/fdr/Permanent/${yy}/${mm}/${day}/grib/ftp/7/4/25/0_37748736_20/${yy}${mm}${day}2200.zip
  unzip ${yy}${mm}${day}2200.zip
done


exit

#------#
# gvf
#------# 

cd gvf/grib2
yy=2021
mm=07

for day in 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31  # 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 #19 20 21 22 23 24 25 26 27 28 29 30 31
do
  hsi get /BMC/fdr/Permanent/${yy}/${mm}/${day}/data/sat/ncep/viirs/gvf/grib2/${yy}${mm}${day}0000.zip
  unzip ${yy}${mm}${day}0000.zip
done


#------#
# sst
#------# 

cd highres_sst
yy=2021
mm=07

for day in 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 # 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 #21 22 23 24 25 26 27 28 29 30 31
do
  hsi get /BMC/fdr/Permanent/${yy}/${mm}/${day}/grib/ftp/7/4/44/0_9331200_0/${yy}${mm}${day}0000.zip
  unzip ${yy}${mm}${day}0000.zip
done




#-------------------------------------------------------#
# RAPv5 operation native grib2 merged with surface fields
#-------------------------------------------------------#

#exp="rap/full/wrfnat/grib2"
#cd $exp

#yy=2021
#mm=05

#for day in  10
#do
#   for cyc in  21 22 23 #00 01 02 03 04 05 06 07 08 09 10 #11 12 13 14 15
#   do
#     hsi get /BMC/fdr/Permanent/${yy}/${mm}/${day}/grib/ftp_rap_hyb/7/0/105/0_794802_32769/${yy}${mm}${day}${cyc}00.zip
#   done
#done



#--------------#
#  rap fcst    #
#--------------#
# 03-21Z, every three has longer forecast at least up to 39 hour.


#exp="rap/130_conus/wrfnat"
#cd $exp

#yy=2020
#mm=08

#for day in  20 21 22 23 24 25 #03 04 05 06 07 08
#do
#   for cyc in  00 # 00 02 04 06 08 10 12 14 16 18 20 22
#   do
#     hsi get /ESRL/BMC/fdr/Permanent/${yy}/${mm}/${day}/data/fsl/${exp}/${yy}${mm}${day}${cyc}00.zip
#   done
#done


#------------------------------#
#  hrrr wrfnat grib2 forecast  #
#------------------------------#

#start_date=20200905
#end_date=20200906

#exp="hrrr/conus/wrfnat/grib2"
#cd $exp

#while [ ${start_date} -le ${end_date} ]; do

#   echo $start_date
#   yy=$(echo $start_date|cut -c 1-4)
#   mm=$(echo $start_date|cut -c 5-6)
#   dd=$(echo $start_date|cut -c 7-8)

#   hsi get /ESRL/BMC/fdr/Permanent/${yy}/${mm}/${dd}/data/fsl/hrrr/conus/wrfnat/${yy}${mm}${dd}0000.zip
#   hsi get /ESRL/BMC/fdr/Permanent/${yy}/${mm}/${dd}/data/fsl/hrrr/conus/wrfnat/${yy}${mm}${dd}1200.zip  2019 path
#   hsi get /BMC/fdr/Permanent/2021/05/11/grib/hrrr_wrfnat/7/0/83/0_1905141_30/202105110300.zip           2021 path

#   start_date=$(/home/Ruifang.Li/bin/bumpidx.x ${start_date} 24)

#done



#--------------------#
# hrrr wrfprd netcdf #
#--------------------#

start_date=20190406
#end_date=20190406

exp="hrrr/conus/wrfprd"
cd $exp

#while [ ${start_date} -le ${end_date} ]; do

   echo $start_date
   yy=$(echo $start_date|cut -c 1-4)
   mm=$(echo $start_date|cut -c 5-6)
   dd=$(echo $start_date|cut -c 7-8)

   for cyc in   05
   do
     hsi get /BMC/rtrr/5year/hrrr_bkgd/$yy/$mm/$dd/${start_date}${cyc}.tar.gz  # data from 2015-2021
   done
   #start_date=$(/home/Ruifang.Li/bin/bumpidx.x ${start_date} 24)

#done




exit
