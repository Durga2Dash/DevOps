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
                  "pattern": "libs-snapshot/*.war",
                   "target": "${WORKSPACE}/"
        }
        ]
        }"""
        server.download(downloadSpec)
        }
        stage('Build Details'){
		sh "touch ${WORKSPACE}/index.html; echo '<h2>This is Code Build - ${BUILD_NUMBER}</h2>\n' >> ${WORKSPACE}/index.html"
		sh "cp ${WORKSPACE}/index.html ${WORKSPACE}/../../scripts/ansible/roles/nginx_role/files/"
        }
        stage("Infrastructure deployment and App deployment") {
          sh "cd ${WORKSPACE}/../../scripts/tfcvpc/azure/module; terraform init; >nohup.out; terraform apply --auto-approve"
	}
	mailer("Succeeded")
	}
        catch(err){
	    mailer("Failed")
            currentBuild.result = 'FAILURE'
        }
}

def mailer(STATUS){
	emailext body: '''Hey! The build ${STATUS} Check this -> ${BUILD_URL}''', subject: 'Reports from your latest build.', to: 'durgamadhab.dash@mindtree.com'	
}
