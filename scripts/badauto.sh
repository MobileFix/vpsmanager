#!/bin/bash
sleep 20
screen -dmS badvpn /bin/badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000 --max-connections-for-client 10
exit
