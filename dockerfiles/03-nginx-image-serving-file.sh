#!/usr/bin/bash

BINARY=/usr/sbin/nginx
LOG_DIR=/var/log/nginx
BINARY_ARGS=
args="$@"
PID=

function get_master_pid {
    PID=$(cat /run/nginx.pid)
}

function create_nginx_config {
    cat <<- EOF > /etc/nginx/sites-available/default
    server {
        listen 80;
        listen [::]:80;

        location / {
            return 302 https://www.youtube.com/watch?v=dQw4w9WgXcQ;
        }
    }
EOF
}

function _run {
    eval "${BINARY} ${BINARY_ARGS} ${args}"
    get_master_pid
}

function _tail {
    tail --pid=$PID -f -n 0 ${LOG_DIR}/{access,error}.log
}

function handle_trap {
    eval "${BINARY} -s stop"
}

trap handle_trap INT QUIT TERM EXIT
create_nginx_config
_run
_tail
