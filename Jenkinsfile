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
    //  stage('Webhook') {
    //     steps {
    //        // Get some code from a GitHub repository
    //        git 'https://github.com/ormishani/webserver1.git'
    //     }
    //  }
    //  stage('build') {
    //     steps {
    //        // Get some code from a GitHub repository
    //              script {
    //      docker.build registry + ":$BUILD_NUMBER"
    //    }
    //     }
    //  }
   }
}