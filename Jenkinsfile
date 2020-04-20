pipeline {
  agent any
  stages {
    stage('foo') {
      steps {
        build 'trigger step'
      }
    }

    stage('bar') {
      steps {
        build 'trigger step'
      }
    }

  }
  environment {
    TAG = '${GIT_BRANCH}'
  }
}