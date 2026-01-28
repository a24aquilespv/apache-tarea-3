#!/usr/bin/bash

# Crear 2 usuarios para jugar con la autenticación Basic
# Autenticación basic: módulo mod_auth_basic
mkdir -p /usr/local/apache/passwd
chown root:www-data /usr/local/apache/passwd
chdmo 750 /usr/local/apache/passwd

htpasswd -c -i /usr/local/apache/passwd/passwords ana <<< 'abc123..'
htpasswd -i /usr/local/apache/passwd/passwords eva <<< 'abc123..'
# Levantar el servidor apache2 en foreground
apache2ctl -D FOREGROUND