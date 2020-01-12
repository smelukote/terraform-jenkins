pipeline {
  agent any
  environment {
    JENKINS_DEPLOY = 'true'
  }
  stages {
    stage('Build') {
      steps {
        sh 'printenv'
        nodejs(nodeJSInstallationName: 'NodeJS 8.11.2 Install') {
            sh 'npm i'
            sh 'npm run build'
        }
        withCredentials([[$class: 'FileBinding', credentialsId: 'google-secret-file', variable: 'GOOGLE_APPLICATION_CREDENTIALS']]) {
          sh 'echo "${GOOGLE_APPLICATION_CREDENTIALS}"' // returns ****
          sh 'gcloud auth activate-service-account --key-file $GOOGLE_APPLICATION_CREDENTIALS'
          sh './deploy.sh'
        }
      }
    }
  }
}
