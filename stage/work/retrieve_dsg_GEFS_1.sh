##!/bin/bash --login

#PBS -A RRFS-DEV
#PBS -q dev_transfer
#PBS -l select=1:ncpus=1:mem=8G
#PBS -l walltime=06:00:00
#PBS -j oe -o log01.gefs
#PBS -N hpss_gefs

set -x

sourcedir1=/BMC/fdr/Permanent/
sourcedir2=/grib/gens_pgrb2b
sourcedir3=/7/2/107/0_259920_0/
#stagedir=/lfs/h2/emc/lam/noscrub/emc.lam/rrfs_retro_data/stage/GEFS/dsg
stagedir=/lfs/h2/emc/da/noscrub/donald.e.lippi/rrfs_retro_data/stage/GEFS/dsg
#/BMC/fdr/Permanent/2022/07/20/grib/gens_pgrb2b/gep23/7/2/107/0_259920_0

for yyyymmdd in 20220724; do
#for yyyymmdd in 20220719 20220720 20220721 20220722 20220723 20220724 20220725 20220726; do
#for yyyymmdd in 20220726 20220725 20220724 20220723 20220722 20220721 20220720 20220719 ; do

  yyyy="${yyyymmdd:0:4}"
  yy="${yyyymmdd:2:2}"
  mm="${yyyymmdd:4:2}"
  dd="${yyyymmdd:6:2}"
  doy=`date  --date=$yyyymmdd +%j `

  for mem in $(seq -w 1 10);  do
  #for mem in $(seq -w 11 20);  do
  #for mem in $(seq -w 21 30);  do
    mkdir -p $stagedir/gep${mem}
    cd $stagedir/gep${mem}
    for hh in $(seq -w 0 6 18) ; do
    #for hh in $(seq -w 06 06) ; do
      if [ ! -s $stagedir/gep${mem}/${yy}${doy}${hh}000000 ] ; then
        echo hsi get  "$sourcedir1/$yyyy/$mm/$dd/$sourcedir2/gep${mem}/$sourcedir3/${yyyymmdd}${hh}00.zip"
        hsi get  $sourcedir1/$yyyy/$mm/$dd/$sourcedir2/gep${mem}/$sourcedir3/${yyyymmdd}${hh}00.zip
        if [ $? -eq 0 ]; then
          echo y | unzip -o ${yyyymmdd}${hh}00.zip
          rm -f ${yyyymmdd}${hh}00.zip
          rm -f ${yy}${doy}${hh}0003??  ${yy}${doy}${hh}0002??   
        fi
      fi
    done
  done

done

#
