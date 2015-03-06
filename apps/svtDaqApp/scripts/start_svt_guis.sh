#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
path=$DIR/../../medm
declare -a gui_arr=("svtMap.adl" "svtDpmStatus.adl" "svtDpmLinkStatus.adl" "svtTemp.adl" "svtHybrid.adl" "svtHybSync.adl" 
"svtFebMain.adl" "svtFlangeMain.adl" "svtBiasMain.adl" "svtDaqIOCStatus.adl")

for i in "${gui_arr[@]}"
do
	echo "medm -x ${path}/${i} &"
	medm -x ${path}/${i} &
done





