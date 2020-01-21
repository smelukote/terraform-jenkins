pipeline {

  agent any

  environment {
    SVC_ACCOUNT_KEY = credentials('terraform-auth')
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
        sh 'mkdir -p creds'
        sh 'echo $SVC_ACCOUNT_KEY | base64 -d > ./creds/serviceaccount.json'
      }
    }
    
    stage('terraform init') {
            steps {
               sh 'terraform init'
            }
         }
    
    stage('terraform plan') {
            steps {
               sh 'terraform plan -out myplan2'
            }
         }
         
    stage('Approval') {
          steps {
           script {
           def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
        }
      }
    }
    
    stage('TF Apply') {
      steps {
        script {
         sh 'terraform apply -input=false myplan2'
        }
      }
    }
    
    
    
    stage('terraform Destroy') {
            steps {
               sh 'terraform destroy -out myplan2'
            }
         }
      }
}
        


          

    
 
