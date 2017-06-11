#!/bin/bash

outputFile=tempTintCfg${1}

#echo "panel_monitor = ${1}" > ${outputFile}
echo "panel_monitor = all" > ${outputFile}
cat ~/.config/tint2/tint2rc >> ${outputFile}

tint2 -c ./${outputFile}

