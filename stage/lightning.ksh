#!/bin/bash 

set -euax

PATH=$PATH:/home/Ruifang.Li/bin


#-----------------------#
# lightning observation #
#-----------------------# 

cd lightning/vaisala/netcdf

yy=2022
mm=07

for day in  06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
do
  for cyc in 00
  do
    hsi get /BMC/fdr/Permanent/${yy}/${mm}/${day}/data/lightning/vaisala/netcdf/${yy}${mm}${day}${cyc}00.zip
    unzip ${yy}${mm}${day}${cyc}00.zip
  done
done


mm=08

for day in  01 02 03 04 05
do
  for cyc in 00
  do
    hsi get /BMC/fdr/Permanent/${yy}/${mm}/${day}/data/lightning/vaisala/netcdf/${yy}${mm}${day}${cyc}00.zip
    unzip ${yy}${mm}${day}${cyc}00.zip
  done
done


exit
