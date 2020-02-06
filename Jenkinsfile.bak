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
					app = docker.build(registry)
					docker push ormishani2020/webserver:app
				}
			}
		}
	}
}