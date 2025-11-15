pipeline {
    agent any

    environment {
        AWS_REGION = "us-east-2"
        ECR_REPO = "603470017892.dkr.ecr.us-east-2.amazonaws.com/container-port"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/DevanshuALW/container-port.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t container-port .'
            }
        }

        stage('Tag Image') {
            steps {
                sh ''' 
                    docker tag container-port:latest $ECR_REPO:${BUILD_NUMBER}
                    docker tag container-port:latest $ECR_REPO:latest
                '''
            }
        }

        stage('Login to ECR') {
            steps {
                sh '''
                    aws ecr get-login-password --region $AWS_REGION |
                    docker login --username AWS --password-stdin $ECR_REPO
                '''
            }
        }

        stage('Push to ECR') {
            steps {
                sh '''
                    docker push $ECR_REPO:${BUILD_NUMBER}
                    docker push $ECR_REPO:latest
                '''
            }
        }
    }
}

