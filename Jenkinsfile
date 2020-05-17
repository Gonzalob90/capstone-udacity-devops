node {
    stage('Checking out git repo') {
      echo 'Checkout...'
      checkout scm
    }
    stage('Checking docker') {
      sh 'git --version'
      sh 'docker -v'
    }
    stage("Linting Dockerfile") {
      echo 'Linting...'
      sh '/home/ubuntu/.local/bin/hadolint Dockerfile'
      sh 'finish linting'
    }
}