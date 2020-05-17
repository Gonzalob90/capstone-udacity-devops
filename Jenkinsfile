node {
    stage('Checking out git repo') {
      echo 'Checkout...'
      checkout scm
    }
    stage('Checking docker') {
      sh 'git --version'
      sh 'docker -v'
    }
}