#!/bin/bash

remote=${REMOTE:-127.0.0.1}
sshd_port=${SSHD_PORT:-22222}
local_sshd_port=${LOCAL_SSHD_PORT:-22}
remote_sshd_port=${REMOTE_SSHD_PORT:-9000}

ssh -nNT \
    -tt \
    -p "$sshd_port" \
    -l assistance \
    -o StrictHostKeyChecking=no \
    -o UserKnownHostsFile=/dev/null \
    -R "$remote_sshd_port:localhost:$local_sshd_port" \
    "$remote"
