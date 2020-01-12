
pipeline {
    agent {
        node {
            label 'master'
        }
    }
    
    environment {
    SVC_ACCOUNT_KEY = credentials('terraform-auth')
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
                sh 'terraform init ./terraform-jenkins'
            }
        }
        
        stage('terraform ended') {
            steps {
                sh 'echo "Ended....!!"'
            }
        }

        
    }
}
