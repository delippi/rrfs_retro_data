#!/bin/bash --login

#PBS -A RRFS-DEV
#PBS -q dev_transfer
#PBS -l select=1:ncpus=1:mem=2G
#PBS -l walltime=05:00:00
#PBS -j oe -o log.rapsoil
#PBS -N hpss_rapsoil

module load hpss
set -x

#stagedir=/lfs/h2/emc/lam/noscrub/emc.lam/rrfs_retro_data/stage
stagedir=/lfs/h2/emc/da/noscrub/donald.e.lippi/rrfs_retro_data/stage/
mkdir -p ${stagedir}/rap_hrrr_soil
cd ${stagedir}/rap_hrrr_soil

yy=2022
yymm=202207
for i in 20 21
do
  mkdir -p ${yymm}${i}
  cd ${yymm}${i}

  # Before July 2022
  #hsi get /NCEPPROD/1year/hpssprod/runhistory/rh${yy}/${yymm}/${yymm}${i}/com_rap_prod_rap.${yymm}${i}00-05.init.tar .
  #hsi get /NCEPPROD/1year/hpssprod/runhistory/rh${yy}/${yymm}/${yymm}${i}/com_hrrr_prod_hrrr.${yymm}${i}_conus00-05.init.tar .
  #hsi get /NCEPPROD/1year/hpssprod/runhistory/rh${yy}/${yymm}/${yymm}${i}/com_hrrr_prod_hrrr.${yymm}${i}_alaska00-05.init.tar .

  #tar xvf ./com_rap_v5.1_rap.${yymm}${i}00-05.init.tar              ./rap.t04z.wrf_inout_smoke
  #tar xvf ./com_hrrr_v4.1_hrrr.${yymm}${i}_conus00-05.init.tar      ./hrrr.t04z.wrf_inout
  #tar xvf ./com_hrrr_v4.1_hrrr.${yymm}${i}_alaska00-05.init.tar     ./hrrrak.t03z.wrf_inout

  # After July 2022, rap and hrrr tar file name changed
  hsi get /NCEPPROD/1year/hpssprod/runhistory/rh${yy}/${yymm}/${yymm}${i}/com_rap_v5.1_rap.${yymm}${i}00-05.init.tar .
  hsi get /NCEPPROD/1year/hpssprod/runhistory/rh${yy}/${yymm}/${yymm}${i}/com_hrrr_v4.1_hrrr.${yymm}${i}_conus00-05.init.tar .
  #hsi get /NCEPPROD/1year/hpssprod/runhistory/rh${yy}/${yymm}/${yymm}${i}/com_rap_v5.1_rap.${yymm}${i}12-17.init.tar .
  #hsi get /NCEPPROD/1year/hpssprod/runhistory/rh${yy}/${yymm}/${yymm}${i}/com_hrrr_v4.1_hrrr.${yymm}${i}_conus12-17.init.tar .
  #hsi get /NCEPPROD/1year/hpssprod/runhistory/rh${yy}/${yymm}/${yymm}${i}/com_hrrr_v4.1_hrrr.${yymm}${i}_alaska00-05.init.tar .
  tar xvf ./com_rap_v5.1_rap.${yymm}${i}00-05.init.tar              ./rap.t04z.wrf_inout_smoke
  tar xvf ./com_hrrr_v4.1_hrrr.${yymm}${i}_conus00-05.init.tar      ./hrrr.t04z.wrf_inout
  #tar xvf ./com_hrrr_v4.1_hrrr.${yymm}${i}_alaska00-05.init.tar     ./hrrrak.t03z.wrf_inout

  cd ..
done


exit





