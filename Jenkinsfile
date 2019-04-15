node{
  stage('Git Checkout'){
      git url: 'https://github.com/anooptcs/my-app.git',
          branch:'master'
  }
  stage('Compile-Package'){
    
      def mvnHome =  tool name: 'maven-3.5.4', type: 'maven'   
      sh "${mvnHome}/bin/mvn package"
   }
  stage('Build Docker Image'){
    sh 'docker build -t anooptcs/tomcat8-jdk8 .'
  }
 stage('Upload Image to DockerHub'){
        withCredentials([string(credentialsId: 'dockeHubPwd', variable: 'dockeHubPwd')]) {
        sh "docker login -u anooptcs -p ${dockeHubPwd}"
    }
    sh 'sudo docker push anooptcs/tomcat8-jdk8'
  }
     stage('Email Notification'){
      mail bcc: '', body: '''Hi Welcome to jenkins email alerts
      Thanks
      Hari''', cc: '', from: '', replyTo: '', subject: 'Jenkins Job', to: 'anoop.upadhyay@gmail.com'
   }

 }

