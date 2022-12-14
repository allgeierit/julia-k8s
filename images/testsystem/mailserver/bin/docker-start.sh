#!/bin/bash
# Note: I've written this using sh so it works in the busybox container too

# USE the trap if you need to also do manual cleanup after the service is stopped,
#     or need to start multiple services in the one container
trap "echo TRAPed signal" HUP INT QUIT TERM

/usr/sbin/syslogd
/usr/sbin/dovecot
postfix start-fg

/usr/sbin/dovecot stop

echo "exited $0"
