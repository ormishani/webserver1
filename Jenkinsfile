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
				echo "hello world"
			}
		}
		stage('build') {
			steps {
				script {
					app = docker.build("ormishani2020/webserver:latest")
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
		stage('deploy image') {
			steps {
					k get pods --all-namespaces
				}
			}
		}
	}
}