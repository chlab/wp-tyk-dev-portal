#!/usr/bin/env bash
if [ ! -d venv ]; then
   virtualenv -p python3 venv/
fi

venv/bin/pip install -r requirements.txt
venv/bin/py.test main.py
