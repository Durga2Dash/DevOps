node {
    def mvnHome
    try{
        stage('Git Checkout & Preparation'){
            git branch: 'main', url: 'https://github.com/amitvashisttech/devops301-mindtree-27-Jan-2021.git'
            mvnHome = tool 'Maven'
        }
        stage('Sonar-Analysis'){
            sh "cd ${WORKSPACE}/petclinic-code && '${mvnHome}/bin/mvn' sonar:sonar -Dsonar.host.url=http://20.44.105.120:8090 -Dsonar.login=96d1b64adb16c3b2bbc23f2de20087a526906ba5"
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
        }
        catch(err){
            currentBuild.result = 'FAILURE'
        }
        }
