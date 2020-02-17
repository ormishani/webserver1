podTemplate(
    label: 'mypod',
    inheritFrom: 'default',
    containers: [
        containerTemplate(
            name: 'helm',
            image: 'ibmcom/k8s-helm:v2.6.0',
            ttyEnabled: true,
            command: 'cat'
        ),
        containerTemplate(
            name: 'docker',
            image: 'docker:18.02',
            ttyEnabled: true,
            command: 'cat'
    )],
    volumes: [
        hostPathVolume(
            hostPath: '/var/run/docker.sock',
            mountPath: '/var/run/docker.sock'
        )
    ]
) {
    node('mypod') {
    //    def commitId
    //    def repository
        stage ('Deploy') {
            container ('helm') {
                sh "/helm list"
            }
        }
        def repository
        stage ('Docker') {
            container ('docker') {
                def registryIp = sh(script: 'getent hosts registry.kube-system | awk \'{ print $1 ; exit }\'', returnStdout: true).trim()
                registryCredential = 'DockerHub'
                app = ""
                repository = "rmishani2020/webserver"
                app = docker.build("ormishani2020/webserver:latest")
                docker.withRegistry( '', registryCredential ) {
                app.push()
               // sh "docker build -t ${repository}:${commitId} ."
               // sh "docker push ${repository}:${commitId}"
            }
        }
    }
}