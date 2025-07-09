pipeline {
  agent any

  environment {
    AWS_ACCESS_KEY_ID     = credentials('aws-access-key')
    AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
  }

  stages {
    stage('Clone Repo') {
      steps {
        git 'https://github.com/manoj4004/terraform-jenkins-demo.git'
      }
    }

    stage('Verify Files') {
      steps {
        sh 'ls -al'
      }
    }

    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }

    stage('Terraform Plan') {
      steps {
        sh 'terraform plan'
      }
    }

    stage('Terraform Apply') {
      steps {
        input "Apply the changes?"
        sh 'terraform apply -auto-approve'
      }
    }
  }
}

