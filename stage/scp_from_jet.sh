##!/bin/bash --login

#PBS -A RRFS-DEV
#PBS -q dev_transfer
#PBS -l select=1:ncpus=1:mem=8G
#PBS -l walltime=06:00:00
#PBS -j oe -o log01.gefs
#PBS -N hpss_gefs

#/lfs/h2/emc/da/noscrub/donald.e.lippi/rrfs/ufs-srweather-app/regional_workflow_blending/ush
#set_rrfs_config.sh

TARGETPATH="/lfs/h2/emc/da/noscrub/donald.e.lippi/rrfs/configs_chunhua/20220627"


JETPATH="/mnt/lfs4/BMC/wrfruc/Ruifang.Li/data/GEFS/dsg/gep23"
JETPATH="/lfs1/BMC/wrfruc/chunhua/code/ufs-srweather-app.0420/regional_workflow/ush/"
JETPATH="/lfs1/BMC/wrfruc/chunhua/code/ufs-srweather-app.0510/regional_workflow/ush/"

files="config.sh.RRFS_CONUS_3km.Mayretro_GDAS config.sh.RRFS_CONUS_3km_ens.Mayretro_GDAS"


for file in $files; do
scp -r Donald.E.Lippi@dtn-jet.boulder.rdhpcs.noaa.gov:${JETPATH}/$file $TARGETPATH/.
done
