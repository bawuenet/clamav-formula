# -*- coding: utf-8 -*-
# vim: ft=sls

{%- from "clamav/map.jinja" import clamav with context %}

clamav-daemon-pkg:
  pkg.installed:
    - name: {{ clamav.daemon.pkg }}

clamav-freshclam-pkg:
  pkg.installed:
    - name: {{ clamav.freshclam.pkg }}
