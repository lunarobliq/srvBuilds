server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;

    #listen 443 ssl;
    #listen [::]:443 ssl;

    server_name site.com;
	root /var/www;

    access_log  /var/log/nginx/nginx_ssl_access.log  main;
    error_log  /var/log/nginx/nginx_ssl_error.log warn;
    #-----------------------------------------------------------        
    index index.php index.html index.htm;
    #--------------------- SSL ---------------------------------
    ssl     on;
    ssl_certificate          /opt/ssl/server.crt;
    ssl_certificate_key      /opt/ssl/server.key;
    ssl_dhparam              /opt/ssl/server.pem;
    #ssl_trusted_certificate /opt/ssl/signed_server.crt;

    ssl_ciphers EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH;

    ssl_session_timeout 10m;
    ssl_protocols TLSv1.2;
    ssl_prefer_server_ciphers on;
    ssl_session_cache shared:SSL:10m;
#   add_header Strict-Transport-Security "max-age=63072000; includeSubdomains; preload";
#   add_header X-Frame-Options DENY;
#   add_header X-Content-Type-Options nosniff;
#   add_header Public-Key-Pins 'pin-sha256="klO23nT2ehFDXCfx3eHTDRESMz3asj1muO+4aIdjiuY="; pin-sha256="633lt352PKRXbOwf4xSEa1M517scpD3l5f79xMD9r9Q="; max-age=2592000; includeS$

    ssl_session_tickets off; # Requires nginx >= 1.5.9
#   ssl_stapling on; # Requires nginx >= 1.3.7
#   ssl_stapling_verify on; # Requires nginx => 1.3.7
    resolver 208.67.222.222 8.8.8.8 valid=300s;
    resolver_timeout 5s;
    #--------------------------------------------------------------------------
    large_client_header_buffers 4 32k;

    location / {
            try_files $uri $uri/ /index.html;
    }

    location ~ \.php$ {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        # NOTE: You should have "cgi.fix_pathinfo = 0;" in php.ini

        fastcgi_pass    unix:/var/run/php7.0-fpm.sock;
        #fastcgi_pass   unix:/var/run/php5-fpm.sock;
        #fastcgi_pass   unix:/tmp/php5-fpm.sock;
        #fastcgi_pass   127.0.0.1:9000;

        fastcgi_index   index.php;
        include         fastcgi_params;
        fastcgi_param   SCRIPT_FILENAME     $document_root$fastcgi_script_name;
        fastcgi_param   SCRIPT_NAME         $fastcgi_script_name;

        #fastcgi_param  REMOTE_ADDR         $http_x_forwarded_for;
        #fastcgi_param  REMOTE_ADDR         $http_x_real_ip;
        #fastcgi_param  REMOTE_ADDR         $http_x_forwarded_for;

        ##---  Fixes the ability to forward ip address to PHP ---
        set_real_ip_from 127.0.0.1/32; 
        real_ip_header X-Forwarded-For;
        ##---------------------------------------------------------------------
        fastcgi_connect_timeout         60;
        fastcgi_send_timeout            60;
        fastcgi_read_timeout            60;
        fastcgi_buffer_size             4k;
        fastcgi_buffers                 512 4k;
        fastcgi_busy_buffers_size       8k;
        fastcgi_temp_file_write_size    256k;
        # ----- Caching -----
        expires 300s;
        add_header Pragma "public";
        add_header Cache-Control "max-age=300, public, must-revalidate, proxy-revalidate";
        add_header X-Powered-By "Perimeter Defense and a few unicorn tears";
        uwsgi_param HTTP_IF_NONE_MATCH $http_if_none_match;
        uwsgi_param HTTP_IF_MODIFIED_SINCE $http_if_modified_since;
    }

    location ~* \.(js)$ {
        expires 600s;
        add_header Pragma "public";
        add_header Cache-Control "max-age=600, public, must-revalidate, proxy-revalidate";
        add_header X-Powered-By "Unicorn Tears";
        access_log  off;
        log_not_found  off;
        uwsgi_param HTTP_IF_NONE_MATCH $http_if_none_match;
        uwsgi_param HTTP_IF_MODIFIED_SINCE $http_if_modified_since;
    }

    location ~* \.(css|html|htm)$ {
        expires 7200s;
        add_header Pragma "public";
        add_header Cache-Control "max-age=7200, public, must-revalidate, proxy-revalidate";
        add_header X-Powered-By "Unicorn Tears";
        access_log  off;
        log_not_found  off;
        uwsgi_param HTTP_IF_NONE_MATCH $http_if_none_match;
        uwsgi_param HTTP_IF_MODIFIED_SINCE $http_if_modified_since;
    }

    location ~* \.(3gp|gif|jpg|jpeg|png|ico|wmv|avi|asf|asx|mpg|mpeg|mp4|pls|mp3|mid|wav|swf|flv|ogg|woff|woff2)$ {
        expires 604800s; # a week
        add_header Pragma "public";
        add_header Cache-Control "max-age=604800, public, must-revalidate, proxy-revalidate";
        add_header X-Powered-By "Unicorn Tears";
        access_log  off;
        log_not_found off;
        uwsgi_param HTTP_IF_NONE_MATCH $http_if_none_match;
        uwsgi_param HTTP_IF_MODIFIED_SINCE $http_if_modified_since;
    }

    location ~ /\.ht { deny all; access_log off; log_not_found off; }

}