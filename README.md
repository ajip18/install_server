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
