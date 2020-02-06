pipeline {
	agent any

	environment {
		registry = "ormishani2020/webserver"
		registryCredential = 'DockerHub'
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
					app = docker.build(registry)
				}
			}
		}
	}
}