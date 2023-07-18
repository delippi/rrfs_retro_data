#!/bin/bash --login

#PBS -A RRFS-DEV
#PBS -q dev_transfer
#PBS -l select=1:ncpus=1:mem=2G
#PBS -l walltime=05:59:00
#PBS -j oe -o log_0724.gfs
#PBS -N hpss_gfs

set -ax

#-----------------#
# gfs forecast #
#-----------------# 
#cd gfs/0p25deg/grib2
#stagedir=/lfs/h2/emc/lam/noscrub/emc.lam/rrfs_retro_data/stage
stagedir=/lfs/h2/emc/da/noscrub/donald.e.lippi/rrfs_retro_data/stage/
mkdir -p ${stagedir}/gfs_tmp
cd ${stagedir}/gfs_tmp

#Summer: 2022 07/19 - 07/27
#Winter: 2022 02/01 - 02/10
#Spring: 2022 04/30 - 05/14
yy=2022
mm=07

for day in 24
do
  for cyc in 00 06 12 18
  do
    hsi get /BMC/fdr/Permanent//${yy}/${mm}/${day}/grib/ftp/7/0/96/0_1038240_0/${yy}${mm}${day}${cyc}00.zip
    unzip ${yy}${mm}${day}${cyc}00.zip
    rm 22????????1*
    rm 22????????2*
    rm 22????????3*
  done
done

exit
