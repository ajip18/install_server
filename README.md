# install_server
for install server wordpress nginx (php,mysql,nginx,wordpress)

1. download file fix_install.php
untuk mendownload file bisa menggunakan wget di linux,

2. beri permision dengan perintah $sudo chmod 700 fix_install.sh
3. install dengan perintah #./fix_install.sh

untuk selanjutnya ikuti perintah installasi.

catatan: terakhir edit file php.ini
search (ctrl+w) cgi.fix .... menjadi 0;
search (ctrl+w) post_max ... menjadi 100M
search (ctrl+w) upload_max ... menjadi 100M

selesai.
semoga bermanfaat...


Jika terjadi error 404  solusinya.
edit file :
#nano nano /etc/php5/fpm/pool.d/www.conf
1.
ubah listen = /var/run/php5-fpm.sock
menjadi => listen = 127.0.0.1:9000

2. edit file /etc/nginx/sites-available/wordpress
  - ubah fastcgi_pass unix:/var/run/php5-fpm.sock;
  - menjadi fastcgi_pass 127.0.0.1:9000;

restart nginx dan php5-fpm
service nginx restart
service php5-fpm restart
