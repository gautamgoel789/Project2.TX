pipeline {
    agent any

    environment {
        IMAGE_NAME = 'goutam24/php-fullstack-app'
        DOCKER_HUB_CREDENTIALS = credentials('dockerhub-creds-id')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/gautamgoel789/Project2.TX.git'
            }
        }

        stage('Build & Push PHP Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:latest")
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-creds-id') {
                        docker.image("${IMAGE_NAME}:latest").push()
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    docker stack rm php-app || echo "No existing stack"
                    sleep 10
                    docker stack deploy -c docker-compose.yml php-app
                '''
            }
        }
    }
}
