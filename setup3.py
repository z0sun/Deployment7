from paramiko import SSHClient, AutoAddPolicy
from rich import print, pretty, inspect

client = SSHClient()

client.load_system_host_keys()

client.set_missing_host_key_policy(AutoAddPolicy())

client.connect("54.80.105.6", username="ubuntu")

stdin, stdout, stderr = client.exec_command('''
                                            source test/bin/activate
                                            rm -rf c4_deployment-5
                                            git clone https://github.com/kura-labs-org/c4_deployment-5.git
                                            cd c4_deployment-5
                                            python -m gunicorn app:app -b 0.0.0.0 -D && echo "Done"
                                            ''')

print(stdout.read().decode("utf-8"))
print(stderr.read().decode("utf-8"))
client.close()
