#!/bin/bash
clear
echo -e "\E[44;1;37m                Otimizar Servidor                \E[0m"
echo ""
#
echo -e "\033[1;33m               Atualizando pacotes\033[0m"
echo ""
apt-get update -y 1>/dev/null 2>/dev/null # Atualizar a lista de pacotes
echo -e "                   \033[1;31mAguarde \033[1;32m.\033[1;33m.\033[1;31m.\033[0m" 
echo ""
echo -e "\033[1;33m      Corrigindo problemas de dependÃªncias"
apt-get -f install 1>/dev/null 2>/dev/null # Corrigir problemas de dependÃªncias, concluir instalaÃ§Ã£o de pacotes pendentes e outros erros
#
echo -e "\033[1;33m            Removendo pacotes inÃºteis"
#
apt-get autoremove -y 1>/dev/null 2>/dev/null # Remover pacotes instalados automaticamente e que nÃ£o tem mais nenhuma utilidade para o sistema
apt-get autoclean -y 1>/dev/null 2>/dev/null # Remover pacotes antigos ou duplicados
#
apt-get clean -y 1>/dev/null 2>/dev/null # Remove arquivos inÃºteis do cache, onde registra as cÃ³pias das atualizaÃ§Ãµes q sÃ£o instaladas pelo gerenciador de pacotes
#
echo -e "\033[1;33m        Removendo pacotes com problemas"
#
apt-get -f remove -y 1>/dev/null 2>/dev/null # Remover pacotes com problemas
#
#Limpar o cache da memoria RAM
clear
echo -e "\E[41;1;37m                                           \E[0m"
echo ""
MEM1=`free|awk '/Mem:/ {print int(100*$3/$2)}'`
ram1=$(free -h | grep -i mem | awk {'print $2'})
ram2=$(free -h | grep -i mem | awk {'print $4'})
ram3=$(free -h | grep -i mem | awk {'print $3'})
echo -e "\033[1;31mMemoria RAM\033[0m"
echo -e "\033[1;33mTotal: \033[1;37m$ram1"
echo -e "\033[1;33mEm Uso: \033[1;37m$ram3"
echo -e "\033[1;33mLivre: \033[1;37m$ram2"
echo ""
echo "MemÃ³ria RAM Usada antes de fazer a limpeza:" $MEM1% 
echo ""
echo -e "\E[41;1;37m                                           \E[0m"
echo " "
echo "LIMPANDO MEMORIA RAM..."
sleep 3
sync 
echo 3 > /proc/sys/vm/drop_caches
echo "LIMPANDO MEMORIA SWAP..."
echo ""
sleep 4
sync && sysctl -w vm.drop_caches=3 1>/dev/null 2>/dev/null
sysctl -w vm.drop_caches=0 1>/dev/null 2>/dev/null
swapoff -a
swapon -a
clear
echo -e "\E[44;1;37m                                           \E[0m"
echo ""
MEM2=`free|awk '/Mem:/ {print int(100*$3/$2)}'`
ram1=$(free -h | grep -i mem | awk {'print $2'})
ram2=$(free -h | grep -i mem | awk {'print $4'})
ram3=$(free -h | grep -i mem | awk {'print $3'})
echo -e "\033[1;31mMemoria RAM\033[0m"
echo -e "\033[1;33mTotal: \033[1;37m$ram1"
echo -e "\033[1;33mEm Uso: \033[1;37m$ram3"
echo -e "\033[1;33mLivre: \033[1;37m$ram2"
echo ""
echo "Uso de memÃ³ria RAM apÃ³s a limpeza:" $MEM2% "Economia de: " `expr $MEM1 - $MEM2`"%"
echo -e "\E[44;1;37m                                           \E[0m"
service ssh restart 1>/dev/null 2>/dev/null # Reiniciar SSH
