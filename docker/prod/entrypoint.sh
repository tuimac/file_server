#!/bin/bash

function config_variable(){
    if [ $# -ne 3 ]; then
        echo 'Need the argument which are PJT_NAME and WORK_DIR.'
        exit 1
    fi
    PJT_NAME=$1
    WORK_DIR=$2
}

function start_backend(){
    gunicorn --config /etc/gunicorn/gunicorn.conf.py --chdir /root/backend &
}

function start_nginx(){
    /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
}

function main(){
    start_backend
    start_nginx
}


main $1 $2
