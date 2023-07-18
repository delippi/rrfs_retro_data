#!/bin/bash
#PBS -j oe
#PBS -o /lfs/h2/emc/da/noscrub/donald.e.lippi/blending/fv3/gdas/test_rsync.out
#PBS -e /lfs/h2/emc/da/noscrub/donald.e.lippi/blending/fv3/gdas/test_rsync.err
#PBS -l select=1:ncpus=1:mem=8GB
#PBS -A RRFS-DEV
#PBS -q dev_transfer
#PBS -l walltime=005:59:05
