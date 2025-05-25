pipeline {
    agent any

    environment {
        IMAGE_NAME = 'goutam24/php-fullstack-app'
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-creds')
    }

    stages {
      //  stage('Checkout') {
        //    steps {
          //      git 'https://github.com/GoutamTx/php_application.git'
            //}
        //}

        stage('Build & Push PHP Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:latest")
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-creds') {
                        docker.image("${IMAGE_NAME}:latest").push()
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    docker-compose down || true
                    docker-compose pull
                    docker-compose up -d --build
                '''
            }
        }
    }
}
