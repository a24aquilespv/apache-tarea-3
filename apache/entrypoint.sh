#!/usr/bin/bash

# Crear 2 usuarios para jugar con la autenticación Basic
# Autenticación basic: módulo mod_auth_basic
mkdir -p /usr/local/apache/passwd
chown root:www-data /usr/local/apache/passwd
chmod 750 /usr/local/apache/passwd

# Usuarios para la autenticación basic
htpasswd -c -i /usr/local/apache/passwd/passwords ana <<< 'abc123..'
htpasswd -i /usr/local/apache/passwd/passwords eva <<< 'abc123..'

# Usuarios para la autenticación basic con grupos
htpasswd -c -i /opt/web/omeusitio.lan/.htcontas_passwords manolo <<< 'abc123..'
htpasswd -i /opt/web/omeusitio.lan/.htcontas_passwords matias <<< 'abc123..'
htpasswd -i /opt/web/omeusitio.lan/.htcontas_passwords anton <<< 'abc123..'
htpasswd -i /opt/web/omeusitio.lan/.htcontas_passwords maria <<< 'abc123..'
htpasswd -i /opt/web/omeusitio.lan/.htcontas_passwords olga <<< 'abc123..'
htpasswd -i /opt/web/omeusitio.lan/.htcontas_passwords xaime <<< 'abc123..'

# Habilitar módulos
a2enmod auth_digest.load
a2enmod authz_groupfile

# Levantar el servidor apache2 en foreground
apache2ctl -D FOREGROUND