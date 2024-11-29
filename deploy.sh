#!/bin/bash

set -eux

date -R
echo "Started deploying."

# rotate logs
function rotate_log () {
  if sudo [ -e $1 ]; then
    sudo mv $1 ${1%%.*}_bak.${1#*.}
  fi
}
rotate_log /var/log/nginx/access.log
rotate_log /var/log/nginx/error.log
rotate_log /var/log/mysql/slow.log
rotate_log /home/isucon/tmp/sqlite3.log
rotate_log ~/pprof/pprof.pb.gz
rotate_log ~/pprof/fgprof.pb.gz


# build go app
cd $APP_DIR/..
docker compose -f docker-compose-go.yml build
cd $APP_DIR

# replace mysqld.cnf
if [ -e ~/etc/mysql/mysqld.cnf ]; then
  sudo cp ~/etc/mysql/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
fi

# replace nginx.conf
if [ -e ~/etc/nginx/nginx.conf ]; then
  sudo cp ~/etc/nginx/nginx.conf /etc/nginx/nginx.conf
fi

# if [ -e ~/etc/nginx/sites-enabled ]; then
#   sudo cp ~/etc/nginx/sites-enabled/* /etc/nginx/sites-enabled/
# fi

if [ -e ~/etc/nginx/sites-available ]; then
  sudo cp ~/etc/nginx/sites-available/* /etc/nginx/sites-available/
fi

# replace limits.conf
if [ -e ~/etc/security/limits.conf ]; then
  sudo cp ~/etc/security/limits.conf /etc/security/limits.conf
fi

# restart services
sudo systemctl restart mysql
sudo systemctl restart $APP_SERVICE_NAME
sudo systemctl restart nginx

date -R
echo "Finished deploying."
