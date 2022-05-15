#!/bin/bash

#--------------------------DEFAULT VARIABLE------------------#
LOGFILE="nginxrl.log"
LOGDIR="/var/log/nginxrl"
LOGPATH="${LOGDIR}/${LOGFILE}"
TIMESTAMP=`date "+%Y-%m-%d %H:%M:%S"`
#-------------------------------COLOR------------------------#
YL='\033[1;33m'
PL='\033[0;35m'
NC='\033[0m' # No Color

#
if [ -d $LOGDIR ] 
then
    echo "The log file was stored at ${LOGPATH}" 
else
    echo "The log file is stored at ${LOGPATH}" 
    sudo mkdir $LOGDIR > /dev/null
    sudo touch $LOGPATH > /dev/null
    sudo chown $USER:$USER $LOGPATH > /dev/null 
fi
#-------------------------------MAIN PROCESS------------------------#
while true; 
do  
    USED_CPU=`grep 'cpu ' /proc/stat | awk '{print ($2+$4)*100/($2+$4+$5)}'`;
    USED_RAM=`free | awk 'NR == 2 {print ($2 -$7)/$2 * 100.0}'`; 
    if [ ${USED_RAM%.*} -ge 80 ] || [ ${USED_CPU%.*} -ge 80 ]
    then 
        echo "$(date "+%Y-%m-%d %H:%M:%S") Caution! High resource usage, CPU in use is: ${USED_CPU%.*}%, RAM in use is: ${USED_RAM%.*}%" >> $LOGPATH
        # restart nginx 
        sudo systemctl restart nginx > /dev/null
        echo "$(date "+%Y-%m-%d %H:%M:%S") Retarted Nginx!" >> $LOGPATH
        echo "$(date "+%Y-%m-%d %H:%M:%S") Sleep for 2 minutes" >> $LOGPATH
        sleep 120
    else 
        echo "$(date "+%Y-%m-%d %H:%M:%S") CPU in use is: ${USED_CPU%.*}%, RAM in use is: ${USED_RAM%.*}%" >> $LOGPATH
        echo "$(date "+%Y-%m-%d %H:%M:%S") Sleep for 1 minute" >> $LOGPATH
        sleep 60
    fi
done

