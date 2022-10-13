pipeline {
    agent any
    tools {
        maven 'mvn'
    }
    stages{
        stage('GIT Checkout') {
            steps {
                git branch: 'main', credentialsId: 'github_cred', url: 'https://github.com/aakashraj47/Caltech_Be_Safe_Capstone.git'
            }
        }
        stage('Build Package') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Docker build and tag') {
            steps {
                sh 'docker build -t ${JOB_NAME}:v1.${BUILD_NUMBER} .'
                sh 'docker tag ${JOB_NAME}:v1.${BUILD_NUMBER} aakashraj47/${JOB_NAME}:v1.${BUILD_NUMBER} '
                sh 'docker tag ${JOB_NAME}:v1.${BUILD_NUMBER} aakashraj47/${JOB_NAME}:latest '
            }
        }
        stage('Push Container') {
            steps {
                //withCredentials([usernameColonPassword(credentialsId: 'dockerhub', variable: 'dockerhubcred')]) {
                withCredentials([string(credentialsId: 'dockerhub-secret', variable: 'dockerhubcred-secret')]) {
                //withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhubcred')]) {
                  sh 'docker login -u aakashraj47 -p ${dockerhubcred-secret}'
                  //sh 'docker login -u aakashraj47 -p aakash...1989'
                  sh 'docker push aakashraj47/${JOB_NAME}:v1.${BUILD_NUMBER}'
                  sh 'docker push aakashraj47/${JOB_NAME}:latest'
                  sh 'docker rmi ${JOB_NAME}:v1.${BUILD_NUMBER} aakashraj47/${JOB_NAME}:v1.${BUILD_NUMBER} aakashraj47/${JOB_NAME}:latest'
                }
            }
        }
        stage('Remove Container') {
            steps {
                sh '/var/lib/jenkins/workspace/bsafe/script.sh'
            }
        }
        stage('Docker Deploy') {
            steps {
                ansiblePlaybook credentialsId: 'ansible-host', disableHostKeyChecking: true, installation: 'ansible', inventory: 'inventory.txt', playbook: 'deploy.yml'
            }
        }
    }
}
