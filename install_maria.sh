#!/bin/bash
echo "Install Maria DB dan konfigurasi"

apt-get update -y
apt-get install mariadb-server

/usr/bin/mysql_secure_installation

echo "Cek Login ke mysql jika sudah muncul maria-db maka berhasil, untuk leuar ketik 'exit' "


mysql -u root -p

service mysql start

echo "Instalasi Selesai"