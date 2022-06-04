#!/bin/bash

codigo_http=$(curl --write-out %{http_code} --silent --output /dev/null www.multillidae.com.br)

if [ $codigo_http -ne 200 ]; then

    echo "Houve um problema com o servidor, tentando reiniciá-lo  $(date +%F\ %T)" >> /logs/servidor.log

    systemctl restart httpd

fi