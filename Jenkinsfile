node {
    def dockerpath = 'gonzalob90/udacity-capstone-project'
    stage('Checking out git repo') {
        echo 'Checkout repo...'
        checkout scm
    }
    stage('Testing docker') {
        sh 'docker -v'
    }
    stage("Linting Dockerfile") {
        echo 'Linting...'
        sh 'hadolint Dockerfile'
    }
    stage('Building and pushing Docker image') {
        echo 'Building Docker Image from Dockerfile'
        withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'dockerPassword', usernameVariable: 'dockerUser')]) {
            sh "docker login -u ${env.dockerUser} -p ${env.dockerPassword}"
            sh "docker build -t ${dockerpath} ."
            sh "docker tag ${dockerpath} ${dockerpath}"
            sh "docker push ${dockerpath}"
            echo 'Pushing to DockerHub finished'
        }
    }
}