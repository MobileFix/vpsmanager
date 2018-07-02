#!/bin/bash

NUMBER=$(ps -x | grep -c "badvpn-udpgw")
if [ $NUMBER = "2" ]; then
    echo "" > /dev/null
else
    screen -dmS screen udp
fi
   
   
   