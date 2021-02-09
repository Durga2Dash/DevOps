node {
    def mvnHome
    def server =Artifactory.server 'art_01'
    try{
        stage('Git Checkout & Preparation'){
            git branch: 'main', url: 'https://github.com/amitvashisttech/devops301-mindtree-27-Jan-2021.git'
            mvnHome = tool 'Maven'
        }
        stage('Sonar-Analysis'){
            sh "cd ${WORKSPACE}/petclinic-code && '${mvnHome}/bin/mvn' sonar:sonar -Dsonar.host.url=http://zwwkb70337dns.eastus2.cloudapp.azure.com:8090 -Dsonar.login=03089cc4ef2a9406261a04a9b9b04f5af8ee3b2b"
        }
        stage('Maven Clean'){
            sh "cd ${WORKSPACE}/petclinic-code && '${mvnHome}/bin/mvn' clean"
        }
        stage('Maven Compile'){
            sh "cd ${WORKSPACE}/petclinic-code && '${mvnHome}/bin/mvn' compile"
        }
        stage('Maven Test'){
            sh "cd ${WORKSPACE}/petclinic-code && '${mvnHome}/bin/mvn' test"
        }
        stage('Maven Package'){
            sh "cd ${WORKSPACE}/petclinic-code && '${mvnHome}/bin/mvn' package"
        }
        stage('Artifactory upload') {
            def uploadSpec = """{
              "files": [
                 {
                  "pattern": "${WORKSPACE}/petclinic-code/target/*.war",
                   "target": "libs-snapshot"
        }
        ]
        }"""
        server.upload(uploadSpec)
        }
        stage('Artifactory download') {
            def downloadSpec = """{
              "files": [
                 {
                  "pattern": "/libs-snapshot/*.war",
                   "target": "/home/mtadmin123"
        }
        ]
        }"""
        server.download(downloadSpec)
        }
        stage("Infrastructure deployment and App deployment") {
          sh "cd /home/mtadmin123/tfcvpc/azure/module; terraform init; >nohup.out; terraform apply --auto-approve"
	}
	}
        catch(err){
            currentBuild.result = 'FAILURE'
        }
}
