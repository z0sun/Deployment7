from paramiko import SSHClient, AutoAddPolicy
from rich import print, pretty, inspect

client = SSHClient()

client.load_system_host_keys()

client.set_missing_host_key_policy(AutoAddPolicy())

client.connect("54.242.110.219", username="ubuntu")

stdin, stdout, stderr = client.exec_command('''python3.7 -m venv test
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
                                            ''')

print(stdout.read().decode("utf-8"))
print(stderr.read().decode("utf-8"))
