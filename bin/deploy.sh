#!/bin/bash
#
# deploy.sh - uploads mateusz.loskot.net to server over SFTP using lftp client
#
# Configuration
ftp_user="mloskot"
ftp_server="sftp://loskot.net"
ftp_dir="public_html/mateusz"
site_dir=${1}
[[ -d ${site_dir} ]] || { echo "Directory '${site_dir}' does not exist"; exit 1; }
[[ -f ${site_dir}/index.html ]] || { echo "Directory '${site_dir}' is not a site"; exit 1; }
lftp -e "mirror -v -R --only-newer --exclude feeds/ ${site_dir} ${ftp_dir}; cd ${ftp_dir}/feeds; put ${site_dir}/feeds/planetosgeo.xml; bye" -u ${ftp_user} ${ftp_server}
