#!/bin/bash -eu
SHELL=/bin/bash
PATH=/home/pi/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games

head monitor/glucose.json cgm/ns-glucose.json cgm/glucose.json && head upload/ns-status.json | json
