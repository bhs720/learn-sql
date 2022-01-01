#!/bin/bash
sudo -u postgres psql -v ON_ERROR_STOP=1 --echo-all -f geo.sql
