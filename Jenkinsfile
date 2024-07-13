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
          environment {
                    DOCKERHUB_CREDENTIALS = credentials('dockerlogin')
            }

            steps {
                script {
                       def dockerImage = docker.build('mk:latest', '.')
                       docker.withRegistry('https://registry.hub.docker.com', 'dockerlogin') {
                       dockerImage.push()
                      }

                    
                }
            }
        }
    }
}
