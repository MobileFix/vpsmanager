#!/bin/bash
clear
#by TwoSSH
fun_menu2 () {
system=$(cat /etc/issue.net)
echo -e "\033[1;33m=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×\033[0m"
echo -e "\033[1;32mHORA\033[1;37m: \033[1;31m$(printf '%(%H:%M:%S)T\n')\033[0m   \033[1;32mDATA\033[1;37m: \033[1;31m$(printf '%(%d/%m/%Y)T\n')\033[0m"
echo -e "\033[1;33m=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×\033[0m"
if [ "$system" ]; then
echo -e "\033[1;32mSistema\033[1;37m: \033[1;31m$system\033[0m"
else
echo -e "\033[1;32mSistema: \033[1;33m[ \033[1;31mNao disponivel \033[0m"
fi
echo -e "\033[1;33m=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×\033[0m"
echo -e "\033[1;36m13\033[1;31m • \033[1;36mADICIONAR HOST"
echo -e "\033[1;36m14\033[1;31m • \033[1;36mREMOVER HOST"
echo -e "\033[1;36m15\033[1;31m • \033[1;36mUSER BACKUP"
echo -e "\033[1;36m16\033[1;31m • \033[1;36mSPEED TEST"
echo -e "\033[1;36m17\033[1;31m • \033[1;36mTRAFEGO"
echo -e "\033[1;36m18\033[1;31m • \033[1;36mTCPTWEAKER"
echo -e "\033[1;36m19\033[1;31m • \033[1;36mDETALHES"
echo -e "\033[1;36m20\033[1;31m • \033[1;36mOTIMIZAR"
echo -e "\033[1;36m21\033[1;31m • \033[1;36mVOLTAR"
echo -e "\033[1;36m00\033[1;31m • \033[1;36mSAIR"
echo -e "\033[1;32m=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×\033[0m"
echo -ne "\033[1;32mQual a opcao: \033[0m"; read x
clear
case $x in

13)
addhost
echo ""
echo -ne "\033[1;32mEnter..\033[0m"; read
;;
14)
delhost
echo ""
echo -ne "\033[1;32mEnter..\033[0m"; read
;;
15)
userbackup
echo ""
echo -ne "\033[1;32mEnter..\033[0m"; read
;;
16)
speedtest
echo ""
echo -ne "\033[1;32mEnter..\033[0m"; read
;;
17)
echo -e "\033[1;33mCTRL C PARA SAIR\033[0m"
sleep 2
nload
menu
;;
18)
tcptweaker
echo ""
echo -ne "\033[1;32mEnter..\033[0m"; read
;;
19)
detalhes
echo ""
echo -ne "\033[1;32mEnter..\033[0m"; read
;;
20)
otimizar
echo ""
echo -ne "\033[1;32mEnter..\033[0m"; read
;;
21)
menu
;;
0|00)
echo -e "\033[1;31msaindo\033[0m"
sleep 2
exit
;;
*)
echo -e "\033[1;31mopcao invalida...\033[0m"
sleep 2
menu
;;
esac
}

x="ok"
while true $x != "ok"
do
clear
if ps x | grep "limiter"|grep -v grep 1>/dev/null 2>/dev/null; then
slimit="\033[1;32mON"
else
slimit="\033[1;31mOFF"
fi
if ps x | grep "badvpn"|grep -v grep 1>/dev/null 2>/dev/null; then
sudp="\033[1;32mON"
else
sudp="\033[1;31mOFF"
fi
if [ -e /etc/openvpn/server.conf ] ; then
	opn="\033[1;32mON"
else
	opn="\033[1;31mOFF"
fi
system=$(cat /etc/issue.net)
echo -e "\033[1;33m=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×\033[0m"
echo -e "\033[1;32mHORA\033[1;37m: \033[1;31m$(printf '%(%H:%M:%S)T\n')\033[0m   \033[1;32mDATA\033[1;37m: \033[1;31m$(printf '%(%d/%m/%Y)T\n')\033[0m"
echo -e "\033[1;33m=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×\033[0m"
if [ "$system" ]; then
echo -e "\033[1;32mSistema\033[1;37m: \033[1;31m$system\033[0m"
else
echo -e "\033[1;32mSistema: \033[1;33m[ \033[1;31mNao disponivel \033[0m"
fi
echo -e "\033[1;33m=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×\033[0m"
echo -e "\033[1;36m01\033[1;31m • \033[1;36mCRIAR USUARIO"
echo -e "\033[1;36m02\033[1;31m • \033[1;36mCRIAR TESTE"
echo -e "\033[1;36m03\033[1;31m • \033[1;36mREMOVER USUARIO"
echo -e "\033[1;36m04\033[1;31m • \033[1;36mMONITOR ONLINE"
echo -e "\033[1;36m05\033[1;31m • \033[1;36mALTERAR LIMITE"
echo -e "\033[1;36m06\033[1;31m • \033[1;36mALTERAR SENHA"
echo -e "\033[1;36m07\033[1;31m • \033[1;36mALTERAR DATA"
echo -e "\033[1;36m08\033[1;31m • \033[1;36mREMOVER EXPIRADOS"
echo -e "\033[1;36m09\033[1;31m • \033[1;36mLIMITAR SSH $slimit"
echo -e "\033[1;36m10\033[1;31m • \033[1;36mBAD VPN $sudp"
echo -e "\033[1;36m11\033[1;31m • \033[1;36mOPENVPN $opn"
echo -e "\033[1;36m12\033[1;31m • \033[1;36mMAIS\033[1;31m≈\033[1;36mOPCOES"
echo -e "\033[1;36m00\033[1;31m • \033[1;36mSAIR"
echo -e "\033[1;33m=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×\033[0m"
echo -ne "\033[1;32mSelecione uma opcao: \033[0m"; read x
clear
case $x in

1|01)
criarusuario
echo ""
echo -ne "\033[1;32mEnter..\033[0m"; read
;;
2|02)
criarteste
echo ""
echo -ne "\033[1;32mEnter..\033[0m"; read
;;
3|03)
remover
echo ""
echo -ne "\033[1;32mEnter..\033[0m"; read
;;
4|04)
sshmonitor
echo ""
echo -ne "\033[1;32mEnter..\033[0m"; read
;;
5|05)
alterarlimite
echo ""
echo -ne "\033[1;32mEnter..\033[0m"; read
;;
6|06)
alterarsenha
echo ""
echo -ne "\033[1;32mEnter..\033[0m"; read
;;
7|07)
mudardata
echo ""
echo -ne "\033[1;32mEnter..\033[0m"; read
;;
8|08)
expcleaner
echo ""
echo -ne "\033[1;32mEnter..\033[0m"; read
;;
9|09)
if ps x | grep "limiter"|grep -v grep 1>/dev/null 2>/dev/null; then
	screen -r -S "limiter" -X quit
	screen -wipe 1>/dev/null 2>/dev/null
	echo -e "\033[1;31mLIMITER SSH DESATIVADO"
	sleep 3
	menu
else
	screen -dmS limiter sshlimiter
	echo -e "\033[1;32mLIMITER SSH ATIVADO"
	sleep 3
	menu
fi
;;
10)
if [ ! -e "/bin/badvpn-udpgw" ]; then
cd $HOME
echo -e "\033[1;32mAGUARDE..." 
wget https://www.dropbox.com/s/tgkxdwb03r7w59r/badvpn-udpgw -o /dev/null
mv -f $HOME/badvpn-udpgw /bin/badvpn-udpgw
chmod 777 /bin/badvpn-udpgw
sleep 2
fi
if ps x | grep "badvpn"|grep -v grep 1>/dev/null 2>/dev/null; then
	screen -r -S "badvpn" -X quit
	screen -wipe 1>/dev/null 2>/dev/null
	echo -e "\033[1;31mBADVPN DESATIVADO"
	sleep 3
	menu
else
	screen -dmS badvpn /bin/badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000 --max-connections-for-client 10
	sleep 1
	echo -e "\033[1;32mBADVPN ATIVADO"
	sleep 2
	menu
fi
;;
11)
openmenu
echo ""
echo -ne "\033[1;32mEnter..\033[0m"; read
;;
12)
fun_menu2
;;
0|00)
echo -e "\033[1;31msaindo\033[0m"
sleep 2
exit;
;;
*)
echo -e "\033[1;31mopcao invalida...\033[0m"
sleep 2
menu
;;
esac
done
