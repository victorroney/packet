#!/bin/bash

resposta="S"

echo " "
echo "ATUALIZANDO PACOTES...."
echo " "
sleep 3

touch READ-ME 


echo "Meu Script de Instalação Linux" > READ-ME
echo "Todo usuário linux tem um script de instalação, estou compartilhando o meu para distribuições linux">> READ-ME
echo "" >> READ-ME
echo "PACOTES">> READ-ME 
echo "">> READ-ME
echo "* instalação de interface gráfica (xfce4, gnome, kde)">> READ-ME
echo "* net-tools">> READ-ME
echo "* spotify">> READ-ME
echo "* Google">> READ-ME
echo "* Pacotes secundários wget, curl, snapd">> READ-ME

apt update && apt upgrade -y

apt install wget curl -y
clear
echo "instalar o gerenciador de pacote snap"
sleep 3

apt install snapd -y

clear
echo ""
echo "Instalando o pacote net-tools"
sleep 3
echo ""
apt install net-tools -y

clear
echo ""
echo "Instalar o pacote do instalador tasksel"
sleep 3
apt install tasksel -y
clear

echo "Deseja instalar o spotify ? <S>"
read resp

declare -u resposta=${resp}


if [ $resposta == "S" ]
then
	
	curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
	echo ""
	echo "criando e editando o arquivo  /etc/apt/sources.list.d/spotify.list"
	sleep 3


 	echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list
	apt-get update && apt-get install spotify-client
	
	clear
	echo "Spotify Instalado ! "
	sleep 3
	clear


else 
	echo "Sem spotify"
	sleep 3
	clear
	

fi


echo "Deseja instalar o google chrome  ? <S>"
read resp

declare -u resposta=${resp}


if [ $resposta == "S" ]
then

        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        dpkg -i google-chrome-stable_current_amd64.deb
	clear
	echo "Google Instalado !"


else 
        echo "Sem google chrome"
        sleep 3
        clear


fi



echo "Deseja configurar seu teclado ? <S> "
read resp

declare -u resposta=${resp}

if [ $resposta == "S" ]
then

        dpkg-reconfigure keyboard-configuration
        clear

else 
        echo "Sem configurar o teclado"

fi


echo "Escolha uma interface gráfica"
echo "[1] - kde plasma"
echo "[2] - gnome-desktop environment"
echo "[3] - xfce4-desktop environment"
echo "[4] - Não instalar e encerrar o programa"
while :
do 
        read escolha
        case $escolha in
                1)
                        apt-get install kde-full kdm kde-l10n-ptbr
			taskel install laptop
			clear
			echo "Habilitando o KDE para iniciar após o boot"
			sleep 3
			systemctl set-default graphical.target
                        break
                        ;;
                2)
                        tasksel install desktop gnome-desktop
			tasksel install laptop
			clear
			echo "Habilitando o gnome para iniciar após o boot"
			sleep 3
			systemctl set-default graphical.target

                        break
                        ;;

                3)
                        apt install task-xfce-desktop
                        break
                        ;;
                4) 
                        echo "não instalar"
                        break
                        ;;
                esac
done
clear

echo "Deseja reiniciar a maquina ? <S>"
read resp

declare -u resposta=${resp}


if [ $resposta == "S" ]
then

	echo "O seu computador será reiniciado em 5"
	sleep 1
	clear
	echo "O seu computador será reiniciado em 4"
	sleep 1
	clear
	echo "O seu computador será reiniciado em 3"
	sleep 1
	clear
	echo "O seu computador será reiniciado em 2"
	sleep 1
	clear
	echo "O seu computador será reiniciado em 1"
	sleep 1
	echo "reboot" 

else 
	echo "Vejo você em breve!"
fi 



