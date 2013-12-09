#!/bin/bash

# CONFIGFILE="/etc/nginx/fastcgi.conf"

# mv "$CONFIGFILE" "$CONFIGFILE.bak"
# echo 'fastcgi_param  SCRIPT_FILENAME    $document_root$fastcgi_script_name;' > "$CONFIGFILE"
# cat "$CONFIGFILE.bak" >> "$CONFIGFILE"


CONFIGFILE="/etc/nginx/nginx.conf"
SITESCONFIG="/etc/nginx/sites.conf"

cp "$CONFIGFILE" "$CONFIGFILE.bak"
cp "$SITESCONFIG" "$SITESCONFIG.bak"

sed -e'/^\t*\s*#gzip  on;/a \ \ \ \ include /etc/nginx/sites.conf;' "$CONFIGFILE" > "$CONFIGFILE.new"
mv "$CONFIGFILE.new" "$CONFIGFILE"

sed 's:^\s*\t*server_name\s*arch-vaio;:a\ \ server_name\ '`hostname`';:' "$SITESCONFIG" > "$SITESCONFIG.new"
mv "$SITESCONFIG.new" "$SITESCONFIG"