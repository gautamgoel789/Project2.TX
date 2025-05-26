pipeline {
    agent any

    environment {
        IMAGE_NAME = 'gautam789/php-fullstack-app'
        
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/gautamgoel789/Project2.TX.git'
            }
        }

        stage('Build & Push PHP Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds-id', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    script {
                        sh '''
                            echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                            docker build -t ${IMAGE_NAME}:latest .
                            docker push ${IMAGE_NAME}:latest
                        '''
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    docker stack rm sad_bose|| echo "No existing stack"
                    sleep 10
                    docker stack deploy -c docker-compose.yml sad_bose
                '''
            }
        }                                                                                                                              
    }
}
