pipeline {
    agent {
        node {
            label 'master'
        }
    }

    stages {
        stage('Build') {
            steps {
           withCredentials([[$class: 'FileBinding', credentialsId: 'google-secret-file', variable: 'GOOGLE_APPLICATION_CREDENTIALS']]) {
           sh 'echo "${GOOGLE_APPLICATION_CREDENTIALS}"' // returns ****
           sh 'gcloud auth activate-service-account --key-file $GOOGLE_APPLICATION_CREDENTIALS'
           }
        
        
        stage('terraform started') {
            steps {
                sh 'echo "Started...!" '
            }
        }
        stage('git clone') {
            steps {
                sh 'rm -r *;git clone https://github.com/smelukote/terraform-jenkins.git'
            }
        }
        stage('terraform init') {
            steps {
                sh 'terraform init ./terraform-jenkins'
            }
        }
        stage('terraform plan') {
            steps {
               sh 'terraform  plan ./terraform-jenkins'
            }
        }
        stage('terraform ended') {
            steps {
                sh 'echo "Ended....!!"'
            }
        }

        
    }
}
