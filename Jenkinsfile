pipeline {
	//agent {
	//		docker { image 'ormishani2020/webserver'}
	//	}
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
			stage('test1'){
			steps {
				sh 'helm list --namespace jenkins' 
			}
		}	
	//	stage('test'){
	//		steps {
	//			sh (script: helm install newchart/) 
	//		}
	//	}			
	}
}