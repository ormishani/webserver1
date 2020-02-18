podTemplate(
    label: 'mypod',
    inheritFrom: 'default',
    containers: [
        containerTemplate(
            name: 'docker',
            image: 'docker:stable',
            ttyEnabled: true,
            command: 'cat'
        )
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
        stage ('Build') {
            container ('docker') {
                app = ""
                script {
                    app = docker.build("ormishani2020/webserver:latest")
                }
            }
        }
    }
}