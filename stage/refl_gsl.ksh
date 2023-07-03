#!/bin/ksh --login

#SBATCH --time=03:00:00
#SBATCH --qos=batch
#SBATCH --partition=service
#SBATCH --ntasks=1
#SBATCH --account=zrtrr
#SBATCH --job-name=stage_retro6
##SBATCH --output=/home/Amanda.Back/massstore/retrostaging6.log

module load hpss

  # Set dates of interest
  year=2022
  month=09
  day=29
  dayEND=29

  # Set destination directories (just set first one)
  export DEST_DIR=/scratch2/BMC/zrtrr/rli/tmp/refl_1
  export STAGE_DIR=/scratch2/BMC/zrtrr/rli/tmp/refl_2

  # Tar file directories where data is placed from mass storage 
  export REFLECT_DEST=${DEST_DIR}/reflect

  # Final expanded directories
  export REFLECT_STAGE=${STAGE_DIR}/reflect

  # Loop through all hours requested
  while [[ $day -le $dayEND ]] ; do
    
    # Set archive directories
    export BASE_DIR=/BMC/fdr/Permanent/${year}/${month}/${day}
    export REFLECT_DIR=${BASE_DIR}/data/radar/mrms


    echo "Copying over REFLECT files for "$month"/"$day"/"$year
    mkdir -p ${REFLECT_DEST}
    cd ${REFLECT_DEST}
    hsi get -r "${REFLECT_DIR}/${year}${month}${day}0000.zip"
    hsi get -r "${REFLECT_DIR}/${year}${month}${day}0300.zip"
    hsi get -r "${REFLECT_DIR}/${year}${month}${day}0600.zip"
    hsi get -r "${REFLECT_DIR}/${year}${month}${day}0900.zip"
    hsi get -r "${REFLECT_DIR}/${year}${month}${day}1200.zip"
    hsi get -r "${REFLECT_DIR}/${year}${month}${day}1500.zip"
    hsi get -r "${REFLECT_DIR}/${year}${month}${day}1800.zip"
    hsi get -r "${REFLECT_DIR}/${year}${month}${day}2100.zip"
    for file in `ls`
    do
      if [[ ! -s $file ]] then
        rm -f ${file}
        hsi get ${REFLECT_DIR}/${file}
        if [[ ! -s $file ]] then
          rm -f ${file}
          echo "WARNING: ${REFLECT_DIR}/${file} appears corrupted and has been skipped"
        fi
      fi
    done

    day=$((day + 1))
    if [[ $day -lt 10 ]] then
      day=0$day
    fi
  done

exit

  echo "Expanding REFLECT files..." # must unzip twice
  mkdir -p ${REFLECT_STAGE}
  cd ${REFLECT_STAGE}
  for file in `ls ${REFLECT_DEST}/*`
  do
    unzip ${file}
    #rm -f ${file}
  done
  cd ${REFLECT_STAGE}
  for file in `ls *.zip`
  do
    unzip ${file} '*MergedReflectivityQC_*'
    #rm -f *.grib2 # remove uneeded GRIB2s:  the desired files will be in "conus/"
    rm -f ${file} # remove the zip
  done
  rm -r alaska/
  rm -r guam/
  rm -r hawaii/
  rm -r carib/

exit 0
