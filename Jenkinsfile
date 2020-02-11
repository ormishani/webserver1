pipeline {
	agent any

	environment {
		registry = "ormishani2020/webserver"
		registryCredential = 'DockerHub'
		app = ""
	}

	stages {
		stage("echo") {
			steps {
				echo "hello world123"
			}
		}
		stage('build') {
			steps {
				script {
					app = docker.build("ormishani2020/webserver:${env.BUILD_ID}")
				}
			}
		}
		stage('upload image') {
			steps {
				script {
				  docker.withRegistry( '', registryCredential ) {
					app.push()
				  }
				}
			}
		}
	}
}