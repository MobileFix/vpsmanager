#!/bin/bash
sleep 30
screen -dmS badvpn /bin/badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients$
exit
