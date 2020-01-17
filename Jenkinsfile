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
    
    if (destroy) {
                stage name: 'Destroy', concurrency: 1
                unstash 'plan'
                if (fileExists("status.destroy")) {
                    sh "rm status.destroy"
                }
                sh "set +e; terraform destroy -force -var-file=environments/${env.PROJECT}/${env.PROJECT}.tfvars; echo \$? > status.destroy"
                def destroyExitCode = readFile('status.destroy').trim()
                if (destroyExitCode == "0") {
                    // slackSend channel: '#ci', color: 'good', message: "Changes Applied ${env.JOB_NAME} - ${env.BUILD_NUMBER} ()"    
                } else {
                    // slackSend channel: '#ci', color: 'danger', message: "Destroy Failed: ${env.JOB_NAME} - ${env.BUILD_NUMBER} ()"
                    currentBuild.result = 'FAILURE'
                }
   
      }
    }
  }

    
 
