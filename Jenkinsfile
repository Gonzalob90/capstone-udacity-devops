node {
    def registry = 'gonzalob90/udacity-capstone-project'
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
        sh 'finish linting'
    }
}