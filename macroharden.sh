#!/usr/bin/bash

if [ -z "$VIRTUAL_ENV" ]; then echo "VENV is not loaded. Did you remember to run: source ./env-ttsky25a.sh"; exit 1; fi
if [ -z "$PDK_ROOT"    ]; then echo "PDK_ROOT isn't set. Did you remember to run: source ./env-ttsky25a.sh"; exit 1; fi

rm -rf openlane/runs/manual
mkdir -p openlane/runs/manual
python -m openlane --pdk-root "$PDK_ROOT" --docker-no-tty --dockerized --run-tag manual --force-run-dir openlane/runs/manual openlane/config.json --design-dir .
ls -aldh openlane/runs/manual/final/gds/*.gds

