clear
tput setaf 2 ; tput bold ; echo "      -------------------------------------------------" ; tput sgr0
echo ""
tput setaf 2 ; tput bold ; echo "Apos digitar 1, digite seu banner e salve com Crtl X, Y e Enter" ; tput sgr0
echo ""
tput setaf 2 ; tput bold ; echo "      -------------------------------------------------" ; tput sgr0
echo ""
echo "Digite 1 para instalar seu banner";
echo "ou";
echo "Digite 2 ou Crtl C para Cancelar";
sleep 2s
read protecao
if [[ "$protecao" = '1' ]]; then
	nano /etc/bannerssh
fi
if [[ "$protecao" = '2' ]]; then
        exit
fi
sleep 1s
clear
tput setaf 2 ; tput bold ; echo "By TwoSSH" ; tput sgr0
