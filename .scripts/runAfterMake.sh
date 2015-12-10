#!/bin/bash

#Finding all executables
executables=`find . -maxdepth 1 -perm -111 -type f`
allFiles=`ls -t`

#run through all  the files in the directory until we find the first executable
#when sorted by timestamp
for file in $allFiles ;do
    for executable in $executables ;do
        if [ ${executable:2} = $file ]; then
            ./$file
            exit
        fi
    done
done
