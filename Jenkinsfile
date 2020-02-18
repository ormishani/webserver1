podTemplate(
    label: 'mypod',
    inheritFrom: 'default',
    containers: [
        containerTemplate(
            name: 'docker',
            image: 'docker:stable',
            ttyEnabled: true,
            command: 'cat'
        ),
        containerTemplate(
            name: 'helm',
            image: 'ibmcom/k8s-helm:v2.6.0',
            ttyEnabled: true,
            command: 'cat'
        )
    ],
    volumes: [
        hostPathVolume(
            hostPath: '/var/run/docker.sock',
            mountPath: '/var/run/docker.sock'
        )
    ]
) {
    node('mypod') {
        def commitId
        stage ('Extract') {
            checkout scm
            commitId = sh(script: 'git rev-parse --short HEAD', returnStdout: true).trim()
        }
        stage ('Build and upload image') {
            container ('docker') {
                app = ""
                script {
                    def registryIp = sh(script: 'getent hosts registry.kube-system | awk \'{ print $1 ; exit }\'', returnStdout: true).trim()
                    repository = "${registryIp}:80/hello"
                    echo repository
                    app = docker.build("ormishani2020/webserver:latest")
                    docker.withRegistry( '', 'DockerHub') {
                        app.push()
                    }
                }
            }
        }
        stage ('Deploy') {
            container ('helm') {
                sh "/helm init --client-only --skip-refresh"
                sh "/helm install --name python --set image.repository='https://kubernetes-charts.storage.googleapis.com' stable/dask"
            }

        }
    }
}