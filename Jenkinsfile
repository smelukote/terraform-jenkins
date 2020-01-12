pipeline {
    agent {
        node {
            label 'master'
        }
    }

    stages {

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
                sh 'sudo terraform init ./terraform-jenkins'
            }
        }
        stage('terraform plan') {
            steps {
               sh 'sudo terraform  plan ./terraform-jenkins'
            }
        }
        stage('terraform ended') {
            steps {
                sh 'echo "Ended....!!"'
            }
        }

        
    }
}
