#  Monitor_script

## I. Linux environment

``` $ sudo chmod a+x Linux/overheat.log```

### Help:

    $ ./Linux/overheat.sh -h     
    Syntax: overheat [-s|l|h]
    options:
    -s     Splunk home directory, default: /opt/splunk/bin/splunk
    -l     Log directory, default: $PWD/RAM-Monitor/overheat.log
    -h     Help!
### Run:

    $ ./Linux/systemd.sh

### Log: (limited 50% RAM usage)

    2022-04-12  10:20:46 Caution! High RAM usage, in use is: 53%
    
    2022-04-12  10:20:46 Retarted Splunk!
    
    2022-04-12  10:21:06 Caution! High RAM usage, in use is: 53%
    
    2022-04-12  10:21:06 Retarted Splunk!
    
    2022-04-12  10:21:16 Caution! High RAM usage, in use is: 53%
    
    2022-04-12  10:21:16 Retarted Splunk!
    
    2022-04-12  10:21:24 Caution! High RAM usage, in use is: 53%
    
    2022-04-12  10:21:24 Retarted Splunk!
    
    2022-04-12  10:21:47 Caution! High RAM usage, in use is: 53%
    
    2022-04-12  10:21:47 Retarted Splunk!
    
    2022-04-12  10:21:59 Caution! High RAM usage, in use is: 53%
    
    2022-04-12  10:21:59 Retarted Splunk!
    
    2022-04-12  10:22:43 Caution! High RAM usage, in use is: 54%
    
    2022-04-12  10:22:43 Retarted Splunk!
    
    2022-04-12  10:22:47 Caution! High RAM usage, in use is: 54%
    
    2022-04-12  10:22:47 Retarted Splunk!
    
    2022-04-12  10:23:27 Caution! High RAM usage, in use is: 53%

