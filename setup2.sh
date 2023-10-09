#!/bin/bash
source test/bin/activate
rm -rf c4_deployment-5
git clone https://github.com/kura-labs-org/c4_deployment-5.git
cd c4_deployment-5
python database.py
sleep 1
python load_data.py
sleep 1 
python -m gunicorn app:app -b 0.0.0.0 -D && echo "Done"
