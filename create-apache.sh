#!/bin/bash

check_command() {
    if [ $? -eq 0 ]; then
        echo "Comando executado com sucesso."
    else
        echo "Erro durante a execução do comando."
        exit 1
    fi
}

echo "Atualizando o Servidor..."
apt-get update
check_command

apt-get upgrade -y
check_command

apt-get install apache2 -y
check_command

apt-get install unzip -y
check_command

echo "Baixando e copiando os arquivos da aplicação..."

cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
check_command

unzip main.zip
check_command

cd linux-site-dio-main
cp -R * /var/www/html/
check_command

echo "Atividade concluída com sucesso!"
