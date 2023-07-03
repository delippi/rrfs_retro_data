#!/bin/bash --login

#PBS -A RRFS-DEV
#PBS -q dev_transfer
#PBS -l select=1:ncpus=1:mem=2G
#PBS -l walltime=05:00:00
#PBS -j oe -o log.ref
#PBS -N hpss_ref

set -ax

#-----------------#
# gfs forecast #
#-----------------# 
#cd gfs/0p25deg/grib2
stagedir=/lfs/h2/emc/lam/noscrub/emc.lam/rrfs_retro_data/stage
mkdir -p ${stagedir}/ref_tmp
cd ${stagedir}/ref_tmp

#--------------#
# reflectivity
#--------------# 

yy=2022
mm=07

for dd in $(seq 22 30);
do

 # 2020-Jun. 2022
 #htar -xvf /NCEPPROD/hpssprod/runhistory/rh${yy}/${yy}${mm}/${yy}${mm}${dd}/dcom_prod_ldmdata_obs.tar ./upperair/mrms/conus/MergedReflectivityQC/MergedReflectivityQC_*_${yy}${mm}${dd}-*.grib2.gz

 # start from Jul. 2022
 htar -xvf /NCEPPROD/hpssprod/runhistory/rh${yy}/${yy}${mm}/${yy}${mm}${dd}/dcom_ldmdata_obs.tar ./upperair/mrms/conus/MergedReflectivityQC/MergedReflectivityQC_*_${yy}${mm}${dd}-*.grib2.gz

done

exit
