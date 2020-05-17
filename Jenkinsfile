def dockerImage = ''

pipeline {
    environment {
        dockerhubCredentials = 'docker-hub-credentials'
    }
    agent any
    stages {
        stage('Test') {
            steps {
                sh 'echo "Test"'
            }
        }
    }
}
