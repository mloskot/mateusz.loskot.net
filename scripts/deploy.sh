#!/bin/sh
# deploy.sh - https://github.com/mloskot/mateusz.loskot.net
set -e
# deployment via FTPS
echo "Deploying public folder..."
echo "PWD=$PWD"
#lftp -e 'set ftp:ssl-force true; set ftp:ssl-protect-data true; set ssl:verify-certificate no; mirror -eRv public .; quit;' -u $FTP_BREXITKNEESHOT:$FTP_FUCKYOUNESTLE $FTP_WHEREBLACKHOLESUN
