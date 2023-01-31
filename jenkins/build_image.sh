#!/bin/bash

# Atualiza a imagem Jenkins local
docker pull jenkins/jenkins:lts-jdk11

# Builda a imagem do Dockerfile para arquitetura ARM64
docker buildx build --platform linux/arm64 -f Dockerfile -t localhost:5000/jenkins-com-docker:lts-jdk11 .

# Faz o push pro Docker Registry local
docker push localhost:5000/jenkins-com-docker:lts-jdk11