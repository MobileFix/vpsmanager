#!/bin/bash
IP=$(cat /etc/IP)
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-15s\n' "Criar Usuário SSH" ; tput sgr0
echo ""
echo -ne "\033[1;32mNome do usuário:\033[1;37m "; read username
awk -F : ' { print $1 }' /etc/passwd > /tmp/users 
if grep -Fxq "$username" /tmp/users
then
	tput setaf 7 ; tput setab 4 ; tput bold ; echo "" ; echo "Este usuário já existe. tente outro nome." ; echo "" ; tput sgr0
	exit 1	
else
	if (echo $username | egrep [^a-zA-Z0-9.-_] &> /dev/null)
	then
		tput setaf 7 ; tput setab 4 ; tput bold ; echo "" ; echo "Você digitou um nome de usuário inválido!" ; tput setab 1 ; echo "Use apenas letras, números, pontos e traços." ; tput setab 4 ; echo "Não use espaços, acentos ou caracteres especiais!" ; echo "" ; tput sgr0
		exit 1
	else
		sizemin=$(echo ${#username})
		if [[ $sizemin -lt 2 ]]
		then
			tput setaf 7 ; tput setab 4 ; tput bold ; echo "" ; echo "Você digitou um nome de usuário muito curto," ; echo "use no mínimo dois caracteres!" ; echo "" ; tput sgr0
			exit 1
		else
			sizemax=$(echo ${#username})
			if [[ $sizemax -gt 10 ]]
			then
				tput setaf 7 ; tput setab 4 ; tput bold ; echo "" ; echo "Você digitou um nome de usuário muito grande," ; echo "use no máximo 10 caracteres!" ; echo "" ; tput sgr0
				exit 1
			else
				if [[ -z $username ]]
				then
					tput setaf 7 ; tput setab 4 ; tput bold ; echo "" ; echo "Você digitou um nome de usuário vazio!" ; echo "" ; tput sgr0
					exit 1
				else	
				   echo -ne "\033[1;32mSenha:\033[1;37m "; read password
					if [[ -z $password ]]
					then
						tput setaf 7 ; tput setab 4 ; tput bold ; echo "" ; echo "Você digitou uma senha vazia!" ; echo "" ; tput sgr0
						exit 1
					else
						sizepass=$(echo ${#password})
						if [[ $sizepass -lt 4 ]]
						then
							tput setaf 7 ; tput setab 4 ; tput bold ; echo "" ; echo "Senha curta!, use no mínimo 4 caracteres" ; echo "" ; tput sgr0
							exit 1
						else	
						    echo -ne "\033[1;32mDias para expirar:\033[1;37m "; read dias
							if (echo $dias | egrep '[^0-9]' &> /dev/null)
							then
								tput setaf 7 ; tput setab 4 ; tput bold ; echo "" ; echo "Você digitou um número de dias inválido!" ; echo "" ; tput sgr0
								exit 1
							else
								if [[ -z $dias ]]
								then
									tput setaf 7 ; tput setab 4 ; tput bold ; echo "" ; echo "Você deixou o número de dias para a conta expirar vazio!" ; echo "" ; tput sgr0
									exit 1
								else	
									if [[ $dias -lt 1 ]]
									then
										tput setaf 7 ; tput setab 4 ; tput bold ; echo "" ; echo "Você deve digitar um número de dias maior que zero!" ; echo "" ; tput sgr0
										exit 1
									else
									    echo -ne "\033[1;32mLimite de conexoes:\033[1;37m "; read sshlimiter
										if (echo $sshlimiter | egrep '[^0-9]' &> /dev/null)
										then
											tput setaf 7 ; tput setab 4 ; tput bold ; echo "" ; echo "Você digitou um número de conexões inválido!" ; echo "" ; tput sgr0
											exit 1
										else
											if [[ -z $sshlimiter ]]
											then
												tput setaf 7 ; tput setab 4 ; tput bold ; echo "" ; echo "Você deixou o limite de conexões vazio!" ; echo "" ; tput sgr0
												exit 1
											else
												if [[ $sshlimiter -lt 1 ]]
												then
													tput setaf 7 ; tput setab 4 ; tput bold ; echo "" ; echo "Número de conexões simultâneas deve ser maior que zero!" ; echo "" ; tput sgr0
													exit 1
												else
													final=$(date "+%Y-%m-%d" -d "+$dias days")
													gui=$(date "+%d/%m/%Y" -d "+$dias days")
													pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
													useradd -e $final -M -s /bin/false -p $pass $username
													clear
													echo -e "\E[44;1;37m      CONTA SSH CRIADA !     \E[0m"
													[ $? -eq 0 ] && tput setaf 2 ; tput bold ; echo ""; echo -e "\033[1;32mIP: \033[1;37m$IP" ; echo -e "\033[1;32mUsuário: \033[1;37m$username" ; echo -e "\033[1;32mSenha: \033[1;37m$password" ; echo -e "\033[1;32mExpira em: \033[1;37m$gui" ; echo -e "\033[1;32mLimite de conexões: \033[1;37m$sshlimiter" ; echo "" || echo "Não foi possível criar o usuário!" ; tput sgr0
													echo "$password" > /etc/Plus/$username
													echo "$username $sshlimiter" >> /root/usuarios.db
													    else
													    menu
													    fi
													fi
												fi
											fi
										fi
									fi
								fi
							fi
						fi
					fi
				fi
			fi
		fi
	fi	
fi
