#!/bin/bash
clear
echo ""
echo "--------------------------------------------------------------------"
#
tput setaf 2 ; tput bold ; echo "	Testando no servidor..." ; tput sgr0
#
speedtest-cli --share
echo ""
