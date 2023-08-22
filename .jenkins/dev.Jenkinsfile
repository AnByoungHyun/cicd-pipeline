pipeline {
    agent any
    environment {
        GITHUB_CREDENTIAL = credentials("github-cicd-pipeline")
        DOCKER_CREDENTIAL = credentials("docker-token")
        REPO_NAME = "cicd-pipeline"
        PROJECT_NAME = "devel-flask"
        DEVEL_VERSION = "v1.0"
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
        stage('테스트를 위한 Docker 이미지 생성') {
            sh "docker build -t ${DOCKER_CREDENTIAL_USR}/${PROJECT_NAME}:latest -f .docker/dev.Dockerfile ."
            sh "docker tag ${DOCKER_CREDENTIAL_USR}/${PROJECT_NAME}:latest ${DOCKER_CREDENTIAL_USR}/${PROJECT_NAME}:${DEVEL_VERSION}"
        }
        stage('테스트 할 수 있도록 Docker 에 배포') {
            steps {
                sh "docker -H tcp://docker-server:2375 stop web1"
                sh "docker -H tcp://docker-server:2375 rm web1"
                sh """
                    docker -H tcp://docker-server:2375 run -it -d -p 8080:80 --name web1 \
                    abhyuni/static-web:${TAG_VERSION}
                """
            }
        }
    }
}