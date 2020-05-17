def dockerImage = ''

pipeline {
    environment {
        dockerhubCredentials = 'docker-hub-credentials'
    }
    agent any
    stages {
        stage('Lint Dockerfile') {
            steps {
                script {
                    docker.image('hadolint/hadolint:latest-debian').inside() {
                        sh 'hadolint Dockerfile'
                    }
                }
            }
        }
        stage('Test') {
            steps {
                sh 'echo "Test"'
            }
        }
    }
}
