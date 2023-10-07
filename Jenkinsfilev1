pipeline {
agent any
stages {
stage ('Build') {
steps {
sh '''#!/bin/bash
python3.7 -m venv test
source test/bin/activate
pip install pip --upgrade
pip install -r requirements.txt
'''
}
}
stage ('test') {
steps {
sh '''#!/bin/bash
source test1/bin/activate
pip install pytest
py.test --verbose --junit-xml test-reports/results.xml
'''
}
post{
always {
junit 'test-reports/results.xml'
}
}
}
stage ('Deploy') {
steps {
sh '''#!/bin/bash
pip install paramiko
pip install rich
python setup.py
'''
}
}
stage ('Reminder') {
steps {
sh '''#!/bin/bash
##############################################################
# The Application should be running on your other instance!! #
##############################################################
'''
}
}
}
}
