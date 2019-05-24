#!/bin/sh

USER_NAME=${USER_NAME:-admin}
USER_PASSWD=${USER_PASSWD:-admin}
USER_EMAIL=${USER_EMAIL:-${USER_NAME}@localhost.local}

if [ ! -f "/data/vm/webvirtmgr.sqlite3" ]; then

chown webvirtmgr /var/run/libvirt/libvirt-sock
/usr/bin/python /webvirtmgr/manage.py syncdb --noinput
echo "from django.contrib.auth.models import User; User.objects.create_superuser('${USER_NAME}', '${USER_EMAIL}', '${USER_PASSWD}')" | /usr/bin/python /webvirtmgr/manage.py shell

fi

