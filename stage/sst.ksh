#!/bin/bash --login

#PBS -A RRFS-DEV
#PBS -q dev_transfer
#PBS -l select=1:ncpus=1:mem=2G
#PBS -l walltime=05:00:00
#PBS -j oe -o log.sst
#PBS -N hpss_sst

set -ax

stagedir=/lfs/h2/emc/lam/noscrub/emc.lam/rrfs_retro_data/stage
mkdir -p ${stagedir}/highres_sst
cd ${stagedir}/highres_sst

#------#
# sst
#------# 

cd highres_sst
yy=2022
mm=07

for day in $(seq 20 30); do  
  hsi get /BMC/fdr/Permanent/${yy}/${mm}/${day}/grib/ftp/7/4/44/0_9331200_0/${yy}${mm}${day}0000.zip
  unzip ${yy}${mm}${day}0000.zip
done

exit
