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
                sh 'terraform init ./terraform'
            }
        }
        stage('terraform plan') {
            steps {
               sh 'terraform  plan ./terraform'
            }
        }
        stage('terraform ended') {
            steps {
                sh 'echo "Ended....!!"'
            }
        }

        
    }
}
