#!/bin/bash

# CONFIGFILE="/etc/nginx/fastcgi.conf"

# mv "$CONFIGFILE" "$CONFIGFILE.bak"
# echo 'fastcgi_param  SCRIPT_FILENAME    $document_root$fastcgi_script_name;' > "$CONFIGFILE"
# cat "$CONFIGFILE.bak" >> "$CONFIGFILE"


CONFIGFILE="/etc/nginx/nginx.conf"

cp "$CONFIGFILE" "$CONFIGFILE.bak"
sed -e'/^\t*\s*#gzip  on;/a \ \ \ \ include /etc/nginx/sites.conf;' "$CONFIGFILE" > "$CONFIGFILE.new"
mv "$CONFIGFILE.new" "$CONFIGFILE"
