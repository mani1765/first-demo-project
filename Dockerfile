pipeline{
    agent any 
    tools{
        maven 'maven3'
    }
    //environment {
      //  PATH = "$PATH:/opt/maven/apache-maven-3.9.8/bin"
    //}
    stages{
        stage('Check out Git Repo'){
            steps{
                git 'https://github.com/mani1765/first-demo-project.git'
            }
        }
        stage('build'){
            
            steps{
                sh 'mvn clean package'
            }
        }
      stage('Build Docker Image') {
            steps {
                script {
                    def dockerImage = docker.build('mani1765/mk:latest', '.')
                    dockerImage.push()
                }
            }
        }
    }
}
