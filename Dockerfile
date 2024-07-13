stage('Build Docker Image') {
            steps {
                script {
                    def dockerImage = docker.build('mani1765/mk:latest', '.')
                    dockerImage.push()
                }
            }
        }
