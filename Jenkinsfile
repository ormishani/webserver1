pipeline {
   agent any
   
    environment {
    registry = "ormishani2020/webserver"
    registryCredential = 'DockerHub'
  }

   stages {
		stage("echo"){
			steps { 
				echo "hello world"
			}
		}
      stage('Clone repository') {
         steps {        
            checkout scm
         }
      }
      stage('build') {
         steps {
            // Get some code from a GitHub repository
                  script {
          app = docker.build(registry)
        }
         }
      }
   }
}