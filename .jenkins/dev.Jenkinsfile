pipeline {
    agent any
    environment {
        GITHUB_CREDENTIAL = credentials("github-cicd-pipeline")
        DOCKER_CREDENTIAL = credentials("docker-token")
        REPO_NAME = "cicd-pipeline"
    }
    triggers {
        // */dev 브렌치에 대한 트리거로 동작하게 해야 함
        githubPush()
    }
    options {
        // 트리거 발생할 때 동작하는 기본 체크아웃 과정 생략
        skipDefaultCheckout(true)
    }
    stages {
        // 기본 체크아웃 대신 동작할 스테이지
        stage("GitHub dev branch checkout") {
            steps {
                checkout scm: scmGit(
                    userRemoteConfigs: [
                        [
                            credentialsId: "github-cicd-pipeline",
                            url: "https://github.com/AnByoungHyun/${REPO_NAME}.git"
                        ]
                    ],
                    branches: [
                        [
                            name: "dev"
                        ]
                    ]
                )
            }
        }
    }
}