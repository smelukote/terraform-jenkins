pipeline {
  agent any
  environment {
    JENKINS_DEPLOY = 'true'
  }
  stages {
    stage('Build') {
      steps {
        sh 'terraform init'
        }
        withCredentials([[$class: 'FileBinding', credentialsId: 'google-secret-file', variable: 'GOOGLE_APPLICATION_CREDENTIALS']]) {
          sh 'echo "${GOOGLE_APPLICATION_CREDENTIALS}"' // returns ****
          sh 'gcloud auth activate-service-account --key-file $GOOGLE_APPLICATION_CREDENTIALS'
          
        }
      }
    }
  }
}
