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
		stage('build and upload') {
			steps {
				script {
					def app = docker.build("ormishani2020/webserver:${env.BUILD_ID}")
					app.push()
				}
			}
		}
	}
}