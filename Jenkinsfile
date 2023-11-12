pipeline {
    agent { label 'awsDeploy2' }
    environment {
        DOCKERHUB_CREDENTIALS = credentials('z0sun-dockerhub')
    }
    stages {
        stage ('Test') {
            steps {
                sh '''#!/bin/bash
                python3.7 -m venv test
                source test/bin/activate
                pip install pip --upgrade
                pip install -r requirements.txt
                pip install mysqlclient
                pip install pytest
                py.test --verbose --junit-xml test-reports/results.xml
                '''
            }
            post {
                always {
                    junit 'test-reports/results.xml'
                }
            }
        }
        stage ('Build') {
            steps {
                sh 'docker build -t z0sun/deploy7bank .'
            }
        }
        stage ('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage ('Push') {
            steps {
                sh 'docker push z0sun/deploy7bank'
            }
        }
        stage('Init') {
            agent { label 'awsDeploy' }
            steps {
                withCredentials([string(credentialsId: 'AWS_ACCESS_KEY', variable: 'aws_access_key'), 
                                 string(credentialsId: 'AWS_SECRET_KEY', variable: 'aws_secret_key')]) {
                    dir('
