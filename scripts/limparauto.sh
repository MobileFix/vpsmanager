#!/bin/bash

function limpar () 
{
exit
}

while true; do
clear
echo -e "\033[1;32mLIMPANDO O SWAP...\033[0m"
echo -e "\033[1;31m"
echo 3 > /proc/sys/vm/drop_caches
sysctl -w vm.drop_caches=3 1>/dev/null 2>/dev/null
swapoff -a && swapon -a 1>/dev/null 2>/dev/null
echo -e "\033[7;31m\033[7;41m"
for prog in $(seq 10);
do
echo -n "||"
sleep 0.1s
echo -n "|"
sleep 0.1s
done
echo -e "\033[0m\033[1;32m-LIMPO!\033[0m"
echo ""
echo -e "\033[1;32mLIMPANDO O CACHE DO SISTEMA...\033[0m"
echo ""
cd /tmp/ && rm -rf *
apt-get clean -y 1>/dev/null 2>/dev/null
apt-get autoremove -y 1>/dev/null 2>/dev/null
cd /root/
echo -e "\033[7;31m\033[7;41m"
for prog in $(seq 10);
do
echo -n "||"
sleep 0.1s
echo -n "|"
sleep 0.1s
done
service openvpn restart
service squid3 restart
service squid restart
service ssh restart
service dropbear restart
echo -e "\033[0m\033[1;32m-LIMPO!\033[0m"
echo ""
exit
done
