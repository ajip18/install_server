#!/bin/bash
COLOR_INFO='\e[1;34m'
COLOR_COMMENT='\e[0;33m'
COLOR_NOTICE='\e[1;37m'
COLOR_NONE='\e[0m'
# Intro
echo -e "${COLOR_INFO}"
echo "=========================================================================================="
echo "=        				Bismillah Mugi Berkah Webnya        			="
echo "=   			        -->>Code Ajip@berkah <<-----            		="
echo "=========================================================================================="
echo "= Spesial Bismillah berkah :D  				="
echo "= Script untuk installasi Nginx server dan wordpress      ="
echo "= install Packet             				="
echo "============================================================"
echo -e "${COLOR_NONE}"
LIST_OF_APPS="nginx php5-common php5-mysqlnd php5-xmlrpc php5-curl php5-gd php5-cli php5-fpm php-pear php5-dev php5-imap php5-mcrypt mysql-server phpmyadmin "
add-apt-repository -y ppa:rtcamp/nginx
sudo add-apt-repository ppa:ondrej/php5
sudo apt-get update 
aptitude install -y $LIST_OF_APPS
# Setting PHP.ini
echo -e "${COLOR_INFO}"
echo "=========================================================================================="
echo "=        				Setting V-Host	         			   	="
echo "= 			ORA NGUBLEK NGUBLEK BANYU BUTHEK ZAL :V                         ="
echo "=               				                                                ="
echo "==========================================================================================="
echo -e "${COLOR_NONE}"
cat << EOF | sudo tee -a /etc/nginx/sites-available/wordpress
server {
        listen 80;

        root /var/www/wordpress;
        index index.php index.html index.htm;

        server_name domain.com;

        error_page 404 /404.html;

        error_page 500 502 503 504 /50x.html;
        location = /50x.html {
                root /usr/share/nginx/html;
        } 
location / {
                # try_files $uri $uri/ =404;
                try_files \$uri \$uri/ /index.php?q=\$uri&\$args;
        }


        location ~ \.php$ {
                try_files \$uri =404;
                fastcgi_split_path_info ^(.+\.php)(/.+)$;
                fastcgi_pass unix:/var/run/php5-fpm.sock;
                fastcgi_index index.php;
                include fastcgi_params;
        }

location = /favicon.ico {
        access_log off;
        log_not_found off;
        expires max;
}
location = /robots.txt {
        access_log off;
        log_not_found off;
}

# Cache Static Files For As Long As Possible
location ~*
\.(ogg|ogv|svg|svgz|eot|otf|woff|mp4|ttf|css|rss|atom|js|jpg|jpeg|gif|png|ico|zip|tgz|gz|rar|bz2|doc|xls|exe|ppt|tar|mid|midi|wav|bmp|rtf)$
{
        access_log off;
        log_not_found off;
        expires max;
}
# Security Settings For Better Privacy Deny Hidden Files
location ~ /\. {
        deny all;
        access_log off;
        log_not_found off;
}
# Return 403 Forbidden For readme.(txt|html) or license.(txt|html)
if (\$request_uri ~* "^.+(readme|license)\.(txt|html)$") {
    return 403;
}
# Disallow PHP In Upload Folder
location /wp-content/uploads/ {
        location ~ \.php$ {
                deny all;
        }
}
}
EOF
sudo ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/wordpress
sudo rm /etc/nginx/sites-enabled/default
cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf_back
rm /etc/nginx/nginx.conf
cat << EOF | sudo tee -a /etc/nginx/nginx.conf
user www-data;
worker_processes 1;
pid /run/nginx.pid;

events {
        worker_connections 768;
         multi_accept on;
         use epoll;
         }


http {

        ##
        # Basic Settings
        ##

        sendfile on;
        tcp_nopush on;
        tcp_nodelay on;
        keepalive_timeout 30;
        types_hash_max_size 2048;
        server_tokens off;
        client_max_body_size  100m;



        # server_names_hash_bucket_size 64;
        # server_name_in_redirect off;

        include /etc/nginx/mime.types;
        default_type application/octet-stream;

        ##
        # Logging Settings
        ##

        access_log /var/log/nginx/access.log;
        error_log /var/log/nginx/error.log;

        ##
        # Gzip Settings
        ##

        gzip on;
        gzip_disable "msie6";

         gzip_vary on;
         gzip_proxied any;
         gzip_comp_level 6;
         gzip_buffers 16 8k;
         gzip_http_version 1.1;
         gzip_types text/plain text/css application/json application/javascript text/xml application/xml application$

 ##
        # Virtual Host Configs
        ##

        include /etc/nginx/conf.d/*.conf;
        include /etc/nginx/sites-enabled/*;
}
EOF
# Setting PHP.ini
echo -e "${COLOR_INFO}"
echo "=========================================================================================="
echo "=        				Install Wordpress + Phpmyadmin	         		="
echo "= 			WES WANI ORA AYO GEK NDANG PES :V                               ="
echo "=               				                                                 ="
echo "==========================================================================================="
echo -e "${COLOR_NONE}"
sudo mkdir /var/www/
cd /var/www/
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
sudo chown -R www-data:www-data wordpress/
sudo usermod -a -G www-data www-data
ln -s /usr/share/phpmyadmin/ /var/www/wordpress/
# Setting PHP.ini
echo -e "${COLOR_INFO}"
echo "=========================================================================================="
echo "=                     Setting php.ini  dan cgi                                            ="
echo "=             ORA SETTTING BEBEK BEBEKAN GUS :V                                           ="
echo "=                                                                                         ="                          
echo "==========================================================================================="
echo -e "${COLOR_NONE}"
sudo nano /etc/php5/fpm/php.ini
sudo service nginx restart
sudo service php5-fpm restart
# Setting PHP.ini
echo -e "${COLOR_COMMENT}"
echo "=========================================================================================="
echo "=        				SAMPUNG RAMPUNG SUHU	         			="
echo "= 			MUGI2 LANCAR WEBSITE + REJEKINE                                 ="
echo "=               			    AMIN	                                        ="
echo "==========================================================================================="
echo -e "${COLOR_NONE}"
