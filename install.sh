#!/bin/bash
clear
IP=$(wget -qO- ipv4.icanhazip.com)
echo "$IP" > /etc/IP
echo -e "\E[41;1;37m            SCRIPT SSH E OPENVPN              \E[0m"
echo ""
echo -ne "\033[1;32mPARA CONTINUAR CONFIRME SEU IP: \033[1;37m"; read -e -i $IP ipdovps
if [[ -z "$ipdovps" ]];then
echo ""
echo -e "\033[1;31mIP invalido\033[1;32m"
sleep 1
clear; exit
fi
echo -e "\n\033[1;37m[\033[1;32mATUALIZANDO PACOTES !\033[1;37m]\033[0m"
sleep 3
echo -e "\n\033[1;33mAguarde\033[1;32m.\033[1;31m.\033[1;33m.\033[0m"
apt-get update -y > /dev/null 2>&1
if [ -f "/root/usuarios.db" ]; then
    echo ""
	echo  -e "\033[1;33mUma base de usuÃ¡rios \033[1;32m(usuarios.db)\033[1;33m foi encontrada!"
	echo -e "\033[1;32m\nOque deseja fazer?"
	echo ""
	echo -e "\033[1;37m[1]\033[1;33m Manter Base de Dados Atual"
	echo -e "\033[1;37m[2]\033[1;33m Criar uma Nova Base de Dados\033[1;32m"
  echo ""
	read -p "Opcão?: " -e -i 1 opcdb
else
	awk -F : '$3 >= 500 { print $1 " 1" }' /etc/passwd | grep -v '^nobody' > /root/usuarios.db
fi
if [[ "$opcdbdb" = '2' ]]; then
	awk -F : '$3 >= 500 { print $1 " 1" }' /etc/passwd | grep -v '^nobody' > /root/usuarios.db
fi
rm /bin/criarusuario /bin/sshmonitor /bin/limitar /bin/criarteste /bin/expcleaner /bin/sshlimiter /bin/addhost /bin/delhost /bin/sshmonitor /bin/ajuda /bin/openvpnsetup /bin/userbackup /bin/tcptweaker /bin/badvpnsetup /bin/otimizar /bin/speedtest /bin/remover /bin/mudardata /bin/alterarlimite /bin/alterarsenha > /dev/null 2>&1
echo -e "\n\033[1;37m[\033[1;32mINSTALANDO PACOTES !\033[1;37m]\033[0m"
apt-get install squid3 nano python-pip inxi python htop -y > /dev/null 2>&1
echo -e "\n\033[1;33mAguarde\033[1;32m.\033[1;31m.\033[1;33m.\033[0m"
apt-get install unzip dos2unix bc screen wget nload dropbear -y > /dev/null 2>&1
pip install speedtest-cli > /dev/null 2>&1
apt-get install apache2 zip -y > /dev/null 2>&1
sed -i "s/Listen 80/Listen 81/g" /etc/apache2/ports.conf > /dev/null 2>&1
service apache2 restart
echo -e "\n\033[1;37m[\033[1;32mDEFININDO CONFIGURACOES !\033[1;37m]\033[0m"
if [ -f "/usr/sbin/ufw" ] ; then
	ufw allow 2466/tcp ; ufw allow 443/tcp ; ufw allow 80/tcp ; ufw allow 3128/tcp ; ufw allow 8799/tcp ; ufw allow 8080/tcp 1> /dev/null 2> /dev/stdout
fi
sleep 2
echo -e "\n\033[1;33mAguarde\033[1;32m.\033[1;31m.\033[1;33m.\033[0m"
wget -O /etc/ssh/sshd_config https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/sshd_config > /dev/null 2>&1
service ssh restart
banner_config(){ echo "© TwoSSH | 2018 All rights reserved" > /etc/bannerssh
}
banner_config
sleep 2
echo -e "\n\033[1;37m[\033[1;32mADICIONANDO FUNCOES !\033[1;37m]\033[0m"
if grep "/bin/false" /etc/shells >/dev/null; then
	echo -n
else
	echo "/bin/false" >> /etc/shells
fi
if [[ -d /etc/squid3/ ]]; then
wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/squid1.txt -O /tmp/sqd1 > /dev/null 2>&1
echo "acl url3 dstdomain -i $ipdovps" > /tmp/sqd2
wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/squid2.txt -O /tmp/sqd3 > /dev/null 2>&1
cat /tmp/sqd1 /tmp/sqd2 /tmp/sqd3 > /etc/squid3/squid.conf
wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/payload.txt -O /etc/squid3/payload.txt > /dev/null 2>&1
echo " " >> /etc/squid3/payload.txt
wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/addhost.sh -O /bin/addhost > /dev/null 2>&1
chmod +x /bin/addhost
wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/delhost.sh -O /bin/delhost > /dev/null 2>&1
chmod +x /bin/delhost
elif [[ -d /etc/squid/ ]]; then
wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/squid1.txt -O /tmp/sqd1 > /dev/null 2>&1
echo "acl url3 dstdomain -i $ipdovps" > /tmp/sqd2
wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/squid.txt -O /tmp/sqd3 > /dev/null 2>&1
cat /tmp/sqd1 /tmp/sqd2 /tmp/sqd3 > /etc/squid/squid.conf
wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/payload.txt -O /etc/squid/payload.txt > /dev/null 2>&1
echo " " >> /etc/squid/payload.txt
wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/addhost2.sh -O /bin/addhost > /dev/null 2>&1
chmod +x /bin/addhost
wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/delhost2.sh -O /bin/delhost > /dev/null 2>&1
chmod +x /bin/delhost
fi
echo -e "\n\033[1;33mAguarde\033[1;32m.\033[1;31m.\033[1;33m.\033[0m"
wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/alterarsenha.sh -O /bin/alterarsenha > /dev/null 2>&1
chmod +x /bin/alterarsenha
wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/criarusuario.sh -O /bin/criarusuario > /dev/null 2>&1
chmod +x /bin/criarusuario
wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/expcleaner2.sh -O /bin/expcleaner > /dev/null 2>&1
chmod +x /bin/expcleaner
wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/mudardata.sh -O /bin/mudardata > /dev/null 2>&1
chmod +x /bin/mudardata
wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/remover.sh -O /bin/remover > /dev/null 2>&1
chmod +x /bin/remover
wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/sshlimiter2.sh -O /bin/sshlimiter > /dev/null 2>&1
chmod +x /bin/sshlimiter
wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/alterarlimite.sh -O /bin/alterarlimite > /dev/null 2>&1
chmod +x /bin/alterarlimite
wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/sshmonitor2.sh -O /bin/sshmonitor > /dev/null 2>&1
chmod +x /bin/sshmonitor
wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/tcptweaker.sh -O /bin/tcptweaker > /dev/null 2>&1
chmod +x /bin/tcptweaker
wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/userbackup2.sh -O /bin/userbackup > /dev/null 2>&1
chmod +x /bin/userbackup
wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/OpenVPN1.sh -O /bin/OpenVPN > /dev/null 2>&1
chmod +x /bin/OpenVPN
wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/otimizar2.sh -O /bin/otimizar > /dev/null 2>&1
chmod +x /bin/otimizar
wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/speedtest2.sh -O /bin/speedtest > /dev/null 2>&1
chmod +x /bin/speedtest
wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/detalhes2.sh -O /bin/detalhes > /dev/null 2>&1
chmod +x /bin/detalhes
wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/menu.sh -O /bin/menu > /dev/null 2>&1
chmod +x /bin/menu
wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/criarteste.sh -O /bin/criarteste > /dev/null 2>&1
chmod +x /bin/criarteste
wget -O /etc/default/dropbear https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/drop_config
echo -e "\n\033[1;37m[\033[1;32mFINALIZANDO INSTALACAO !\033[1;37m]\033[0m"
sed -i '3i\127.0.0.1 d1n212ccp6ldpw.cloudfront.net\' /etc/hosts
sleep 1
sed -i '4i\127.0.0.1 portalrecarga.vivo.com.br/recarga\' /etc/hosts
sleep 1
sed -i '5i\127.0.0.1 portalrecarga.vivo.com.br/controle\' /etc/hosts
sleep 1
sed -i '6i\127.0.0.1 navegue.vivo.com.br/pre/\' /etc/hosts
sleep 1
sed -i '7i\127.0.0.1 navegue.vivo.com.br/controle/\' /etc/hosts
sleep 2
echo -e "\n\033[1;33mAguarde\033[1;32m.\033[1;31m.\033[1;33m.\033[0m"
service ssh restart > /dev/null 2>&1
service dropbear restart > /dev/null 2>&1
if [[ -e /etc/squid/squid.conf ]]; then
squid -k reconfigure > /dev/null 2>&1
service squid restart > /dev/null 2>&1
elif [[ -e /etc/squid3/squid.conf ]]; then
squid3 -k reconfigure > /dev/null 2>&1
service squid3 restart > /dev/null 2>&1
fi
echo "America/Sao_Paulo" > /etc/timezone
ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata > /dev/null 2>&1
# menu
cd
echo "menu" >> .bash_profile
rm /root/install.sh
clear
echo -e "\n\033[1;37m[\033[1;31m• \033[1;32mINSTALACAO CONCLUIDA !\033[1;31m• \033[1;37m]\033[0m"
