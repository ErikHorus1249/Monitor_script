#!/bin/bash

LOGFILE="rammonotor.log"
TIMESTAMP=`date "+%Y-%m-%d %H:%M:%S"`

# flag 
while getopts l: flag
do
    case "${flag}" in
        l) LOGFILE=${OPTARG};;
    esac
done

while true; 
do  
    USED_RAM=`free | awk 'NR == 2 {print ($2 -$7)/$2 * 100.0}'`; 
    if [ ${USED_RAM%.*} -ge 30 ]
    then 
        # service docker status | grep 'active (running)' > /dev/null 2>&1
        echo "$(date "+%Y-%m-%d %H:%M:%S") Caution! overheat. Used RAM is ${USED_RAM%.*}%" >> $LOGFILE
        # restart splunk 
        sudo service docker restart > /dev/null
        echo "$(date "+%Y-%m-%d %H:%M:%S") Retart docker now!" >> $LOGFILE
        sleep 15
    else 
        echo "$(date "+%Y-%m-%d %H:%M:%S") Ram is ok" >> $LOGFILE
        echo Used Ram is: ${USED_RAM%.*};
    fi
    sleep 2;
done

