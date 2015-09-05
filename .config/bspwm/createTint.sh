#!/bin/bash

outputFile=tempTintCfg${1}

echo "panel_monitor = ${1}" > ${outputFile}
cat ~/.config/tint2/tint2rc >> ${outputFile}

tint2 -c ./${outputFile}
