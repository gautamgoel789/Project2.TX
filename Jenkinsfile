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
                            docker build -t gautam789/php-fullstack-app:latest .
                            docker push gautam789/php-fullstack-app:latest
                        '''
                    }
                }
            }
        }

    stage('Deploy') {
            steps {
                sh'''
                    docker stack rm php-app
                    timeout /t 10
                    docker stack deploy -c docker-compose.yml php-app
                '''
            }
        }                                                                                                                                
    }
}
