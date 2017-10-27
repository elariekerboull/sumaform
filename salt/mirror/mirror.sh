#!/bin/bash
set -e
set -x

cd /srv/mirror
minima -c /root/minima.yaml sync >/var/log/minima.log
/root/refresh_scc_data.py {{ grains.get("cc_username") }}:{{ grains.get("cc_password") }}

chmod -R 777 .
