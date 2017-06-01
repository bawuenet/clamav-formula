# -*- coding: utf-8 -*-
# vim: ft=sls

{%- from "clamav/map.jinja" import clamav with context %}

{%- if salt['grains.get']('os') == 'Debian' and salt['grains.get']('init') == 'systemd' %}
clamav-daemon-service-config:
  file.managed:
    - name: /etc/systemd/system/clamav-daemon.socket.d/extend.conf
    - source: salt://clamav/files/extend.conf
    - template: jinja
    - mode: 644
    - user: root
    - group: root
    - context:
        settings: {{ clamav.daemon.get('systemd', {})|json }}
    - watch_in:
        service: clamav-daemon
{%- endif %}
