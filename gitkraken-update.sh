#!/bin/bash

rm gitkraken-amd64.deb || true

wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo dpkg -i ./gitkraken-amd64.deb
sudo apt-get install -f

rm gitkraken-amd64.deb || true
