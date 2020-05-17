def dockerImage = ''

pipeline {
    environment {
        dockerhubCredentials = 'docker-hub-credentials'
    }
    agent none
    stages {
        stage ('Test docker') {
            agent {
                docker { image 'hadolint/hadolint:latest-debian' }
            }
            steps {
                sh 'docker -v'
            }
        }
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
