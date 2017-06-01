# -*- coding: utf-8 -*-
# vim: ft=sls

{%- from "clamav/map.jinja" import clamav with context %}


clamav-daemon:
  service.running:
    - name: {{ clamav.daemon.service.name }}
    - enable: True

clamav-freshclam:
  service.running:
    - name: {{ clamav.freshclam.service.name }}
    - enable: True
