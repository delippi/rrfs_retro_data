#!/bin/bash 

set -euax


# jul to date
#day=212
#date -d "`date +%Y`-01-01 +$(( ${day} - 1 ))days" +%Y-%m-%d

#exit


# date to jul
cyc=2022071900
YYYY=${cyc:0:4}
MM=${cyc:4:2}
DD=${cyc:6:2}
HH=${cyc:8:2}
JDATE=`date -d  "${cyc:0:8} $HH" +%y%j%H00`
echo $YYYY $MM $DD $HH $JDATE

