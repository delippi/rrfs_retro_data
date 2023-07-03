#!/bin/ksh

set -euax

tmp=tmp/upperair/mrms/conus/MergedReflectivityQC/

cd $tmp

#for file in `ls *20220723*.gz  *20220724*.gz  *20220725*.gz   *20220726*.gz  `
for file in `ls *20220929*.gz  *20220930*.gz  `
do
    gzip -d ${file}
done

