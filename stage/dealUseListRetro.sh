#!/bin/bash

retro_bgn="20210501"
retro_end="20210531"

seed_list="2021-06-07_meso_uselist.txt"

case $1 in
  check|chk|ls|list)
    chk_or_ln="ls -lrth "
    ;;
  link|ln)
    chk_or_ln="ln -snf "
    ;;
  *)
    echo "Usage: $0 <check|link>"
    echo
    exit
    ;;
esac

D=${retro_bgn}
while [ $D -le $retro_end  ]; do
  if [[ $chk_or_ln == "ls"* ]]; then seed_list=""; fi
  echo -n "$D "
  $chk_or_ln  $seed_list "${D:0:4}-${D:4:2}-${D:6:2}_meso_uselist.txt"
  D=$(date -u +"%Y%m%d" -d "${D:0:8} ${D:8:2} 1 day")
done
echo
