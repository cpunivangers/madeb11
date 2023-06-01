#!/bin/sh
 
# 10/2020
# christian.pottier@univ-angers.fr
#  
# vérif svgdir.sh à faire ?
DIRSVG=$(basename $(pwd))

cd ..

find $DIRSVG -type f -newer $DIRSVG.tar.gz -and -not -path \*/.\* -printf "%h/%f : Date modif =  %Td %Tb %TY\n" | more
