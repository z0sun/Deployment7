#!/bin/bash

sudo apt update
sudo apt -y software-properties-common 
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt install -y python3.7 python3.7-venv
python3.7 -m venv test
source test/bin/activate
git clone https://github.com/kura-labs-org/c4_deployment-5.git
cd c4_deployment-5
pip install -r requirements.txt
pip install gunicorn
python database.py
sleep 1
python load_data.py
sleep 1 
python -m gunicorn app:app -b 0.0.0.0 -D
echo "Done"

