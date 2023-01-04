pipeline {
    agent any
    tools {
        terraform 'terraform'
        }
stages {
        stage('Git Checkout') {
            steps {
                git branch: 'devops', credentialsId: 'Git', url: 'https://github.com/sonykrishna/KPMG'
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                withCredentials([file(credentialsId: 'gcpcreds', variable: 'service.json')])
                {
                sh 'terraform plan'
                }
            }
            }
        stage('Terraform Apply') {
            steps {
                withCredentials([file(credentialsId: 'gcpcreds', variable: 'service.json')])
                {
                
                sh 'terraform apply --auto-approve'
                }
            }
        }
        stage('Terraform Destroy') {
            steps {
                withCredentials([file(credentialsId: 'gcpcreds', variable: 'service.json')])
                {
                sh 'terraform destroy --auto-approve'
                }
            }
        }
    }
}



