#!/bin/bash --login

#PBS -A RRFS-DEV
#PBS -q dev_transfer
#PBS -l select=1:ncpus=1:mem=2G
#PBS -l walltime=06:00:00
#PBS -j oe -o log.rapobs_0722_0726
#PBS -N hpss_rapobs

set -x
module load hpss

#-----------------#
# rap observation #
#-----------------# 

#cd obs_rap
#cd /lfs/h2/emc/lam/noscrub/emc.lam/rrfs_retro_data/stage/obs_rap_tmp
stagedir=/lfs/h2/emc/da/noscrub/donald.e.lippi/rrfs_retro_data/stage/
mkdir -p ${stagedir}/obs_rap_tmp
cd ${stagedir}/obs_rap_tmp


yy=2022
mm=07

for day in $(seq 22 26); do
  for cyc in 00 06 12 18
#  for cyc in 18
  do
    hsi get /BMC/fdr/Permanent/${yy}/${mm}/${day}/data/grids/rap/obs/${yy}${mm}${day}${cyc}00.zip
    unzip ${yy}${mm}${day}${cyc}00.zip
  done
done


exit

# 2019 rap data
# 2019 data in six zip file for each type, need langley nexrad prepbufr satwnd for RRFS retro 
#/BMC/fdr/Permanent/2019/02/01/data/grids/rap/langley/   nexrad/    prepbufr/  radiance/  radwnd/    satwnd/  
#unzip ${yy}${mm}${day}${cyc}00.zip

