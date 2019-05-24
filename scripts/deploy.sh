#!/bin/sh
# deploy.sh - https://github.com/mloskot/mateusz.loskot.net
set -e
# deployment via FTPS
echo "Deploying public folder..."
lftp -e 'set ftp:ssl-force true; set ftp:ssl-protect-data true; set ssl:verify-certificate no; mirror --exclude tmp/ --exclude-glob ".ftpquota" --exclude-glob ".htaccess" -R --verbose=1 public .; quit;' -u $FTP_BREXITKNEESHOT:$FTP_FUCKYOUNESTLE $FTP_WHEREBLACKHOLESUN
