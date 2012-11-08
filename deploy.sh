#!/bin/sh
#
# deploy.sh - uploads mateusz.loskot.net to server over SFTP using lftp client
#
# Configuration
ftp_user="mloskot"
ftp_server="sftp://loskot.net"
ftp_dir="public_html/mateusz"
local_dir="./_site"
# Deploy
lftp -e "mirror -v -R ${local_dir} ${ftp_dir}; bye" -u ${ftp_user} ${ftp_server}
