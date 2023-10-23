#!/bin/bash

sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt install -y python3.7
sudo apt install -y python3.7-venv
sudo apt-get install -y build-essential
sudo apt-get install -y libmysqlclient-dev
sudo apt-get install python3.7-dev
python3.7 -m venv test
source test/bin/activate
git clone https://github.com/kura-labs-org/c4_deployment-5.git
cd c4_deployment-5
pip install mysqlclient
pip install -r requirements.txt
pip install gunicorn
python -m gunicorn app:app -b 0.0.0.0 -D
echo "Done"

