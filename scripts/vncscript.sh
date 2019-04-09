#!/bin/bash
clear
IP=$(wget -qO- ipv4.icanhazip.com)

if [ -d  /root/.vnc/ ];then
vnc=$(ls /root/.vnc/ | grep :1.pid)
else
vnc=""
fi

if [[ $vnc = "" ]]; then
echo -ne " VNC nao Esta ativo Deseja Ativar? [S/N]: "; read x
[[ $x = @(n|N) ]] && echo -e " ====================================================== " && return
echo -e " ====================================================== "
echo -e " Installing VNC:"
apt-get install xfce4 xfce4-goodies gnome-icon-theme tightvncserver
echo -e " Installing DEPENDENCE:"
apt-get install iceweasel
echo -e " Installing FIREFOX:"
apt-get install firefox
clear
echo -e " ====================================================== }"
echo -e " ESCOLHA UMA SENHA e DEPOIS CONFIRMA "
echo -e " ====================================================== "
vncserver
echo -e " ====================================================== "
echo -e " VNC se conecta usando o ip da vps na porta 5901"
echo -e " Use: $IP:5901"
echo -e " Para acessar a interface gráfica "
echo -e " Baixe na PlayStore: VNC VIWER"
elif [[ $vnc != "" ]]; then
echo -e " VNC Esta ativo Deseja Desativar? [S/N]: "; read x
[[ $x = @(s|S) ]] && echo -e " ====================================================== " && return
echo -e " ====================================================== "
echo -e " Desligando VNC:"
vncserver -kill :1 > /dev/null
vncserver -kill :2 > /dev/null
vncserver -kill :3 > /dev/null
vncserver -kill :4 > /dev/null
fi
echo -e " ====================================================== "
