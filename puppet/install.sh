#!/bin/bash

# script set in background
setsid ./set-puppet-conf.sh > output.txt &

# run systemd
exec /usr/sbin/init sshd
