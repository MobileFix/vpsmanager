#!/bin/bash
clear

if [ -f /etc/lsb-release ]
then
echo -e "\033[1;31mSistema Operacional\033[0m"
name=$(cat /etc/lsb-release |grep DESCRIPTION |awk -F = {'print $2'})
codename=$(cat /etc/lsb-release |grep CODENAME |awk -F = {'print $2'})
echo -e "\033[1;33mNome: \033[1;37m$name"
echo -e "\033[1;33mCodeName: \033[1;37m$codename"
echo -e "\033[1;33mKernel: \033[1;37m$(uname -s)"
echo -e "\033[1;33mKernel Release: \033[1;37m$(uname -r)"
if [ -f /etc/os-release ]
then
devlike=$(cat /etc/os-release |grep LIKE |awk -F = {'print $2'})
echo -e "\033[1;33mDerivado do OS: \033[1;37m$devlike"
echo ""
fi
else
system=$(cat /etc/issue.net)
echo -e "\033[1;31mSistema Operacional\033[0m"
echo -e "\033[1;33mNome: \033[1;37m$system"
echo ""
fi

if [ -f /proc/cpuinfo ]
then
echo -e "\033[1;31mProcessador\033[0m"
modelo=$(cat /proc/cpuinfo |grep "model name" |uniq |awk -F : {'print $2'})
cpucores=$(grep -c cpu[0-9] /proc/stat)
cache=$(cat /proc/cpuinfo |grep "cache size" |uniq |awk -F : {'print $2'})
echo -e "\033[1;33mModelo:\033[1;37m$modelo"
echo -e "\033[1;33mNucleos:\033[1;37m $cpucores"
echo -e "\033[1;33mMemoria Cache:\033[1;37m$cache"
echo -e "\033[1;33mArquitetura: \033[1;37m$(uname -p)"
echo ""
else
echo -e "\033[1;31mProcessador\033[0m"
echo "Não foi possivel obter informações sobre o Processador"
fi

if free 1>/dev/null 2>/dev/null
then
ram1=$(free -h | grep -i mem | awk {'print $2'})
ram2=$(free -h | grep -i mem | awk {'print $4'})
ram3=$(free -h | grep -i mem | awk {'print $3'})

echo -e "\033[1;31mMemoria RAM\033[0m"
echo -e "\033[1;33mTotal: \033[1;37m$ram1"
echo -e "\033[1;33mEm Uso: \033[1;37m$ram3"
echo -e "\033[1;33mLivre: \033[1;37m$ram2"
else
echo -e "\033[1;32mMemoria RAM\033[0m"
echo "Não foi possivel obter informações sobre a memoria RAM"
fi
