node {
    def dockerpath = 'gonzalob90/udacity-capstone-project'
    stage('Checking out git repo') {
        echo 'Checkout repo...'
        checkout scm
    }
    stage('Testing Docker & AWS') {
        sh 'docker -v'
        sh 'aws --version'
    }
    stage("Linting Dockerfile") {
        echo 'Linting...'
        sh 'hadolint Dockerfile'
    }
    stage('Build & push Docker image') {
        echo 'Building Docker Image from Dockerfile'
        withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'dockerPassword', usernameVariable: 'dockerUser')]) {
            sh "docker login -u ${env.dockerUser} -p ${env.dockerPassword}"
            sh "docker build -t ${dockerpath} ."
            sh "docker tag ${dockerpath} ${dockerpath}"
            sh "docker push ${dockerpath}"
            echo 'Pushing to DockerHub finished'
        }
    }
    stage('Deploy to AWS EKS') {
        echo 'Deploying to AWS'
        dir('k8s') {
            withAWS(credentials: 'aws-capstone', region: 'us-west-2') {
                sh 'aws eks --region us-west-2 update-kubeconfig --name Capstone'
                sh 'kubectl apply -f app-deployment.yml'
                sh 'kubectl get pods'
                sh 'kubectl set image deployment/capstone-app capstone-app=${dockerpath}:latest'
                sh 'kubectl set image deployment/capstone-app capstone-app=${dockerpath}'
                sh 'kubectl rollout status deployment capstone-app'
                sh 'kubectl get pods'
                sh 'kubectl get deployment capstone-app'
                echo 'Deploy finished'
            }
        }
    }
}