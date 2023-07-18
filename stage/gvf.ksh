#!/bin/bash --login

#PBS -A RRFS-DEV
#PBS -q dev_transfer
#PBS -l select=1:ncpus=1:mem=2G
#PBS -l walltime=06:00:00
#PBS -j oe -o log.gvf_0722_0726
#PBS -N hpss_gvf

set -euax


#stagedir=/lfs/h2/emc/lam/noscrub/emc.lam/rrfs_retro_data/stage
stagedir=/lfs/h2/emc/da/noscrub/donald.e.lippi/rrfs_retro_data/stage/
mkdir -p ${stagedir}/gvf/grib2
cd ${stagedir}/gvf/grib2

#------#
# gvf
#------# 

#cd gvf/grib2
yy=2022
mm=07

for day in $(seq 22 26); do
  hsi get /BMC/fdr/Permanent/${yy}/${mm}/${day}/data/sat/ncep/viirs/gvf/grib2/${yy}${mm}${day}0000.zip
  unzip ${yy}${mm}${day}0000.zip
done

exit

