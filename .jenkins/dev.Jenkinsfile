pipeline {
    agent any
    environment {
        GITHUB_CREDENTIAL = credentials('github-cicd-pipeline')
        DOCKER_CREDENTIAL = credentials('docker-token')
        REPO_NAME = 'cicd-pipeline'
    }
    triggers {
        // */dev 브렌치에 대한 트리거로 동작하게 해야 함
        githubPush()
    }
    options {
        skipDefaultCheckout(true)
    }
    stages {
        stage('GitHub dev branch checkout') {
            checkout scm: scmGit(
                userRemoteConfigs: [
                    [
                        credentialsId: 'github-cicd-pipeline',
                        url: 'https://github.com/AnByoungHyun/\$REPO_NAME.git'
                    ]
                ],
                branches: [
                    [
                        name: 'dev'
                    ]
                ]
            )
        }
    }
}