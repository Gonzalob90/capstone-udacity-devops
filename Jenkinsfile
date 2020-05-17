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
                    def hadolintImage = docker.build('hadolint/hadolint:latest:debian')

                    hadolintImage.inside {
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
