#!/bin/sh
set -eu

stage=${1:-'default'}

cat <<EOF
COMPOSE_PROJECT_NAME=ssh-forward
SSHD_PORT=22222
REDIRECTED_SSHD_PORT=22223
EOF
