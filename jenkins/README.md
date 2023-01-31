# Meu Jenkins customizado com Docker

## Passo a passo para gerar a imagem atualizada:

### Primeiro baixe a imagem mais atualizada do Jenkins que esta no Dockerfile, no caso a 'jenkins/jenkins:lts-jdk11'
```shell script
$ docker pull jenkins/jenkins:lts-jdk11
```
---
### Após baixar a imagem mais atualizada do Jenkins, você precisará buildar a imagem customizada:
```shell script
$ docker buildx build --platform ${PLATAFORMA} -f Dockerfile -t ${DOCKER_REGISTRY}/${DOCKER_IMAGE_WITH_TAG} .
```
No lugar da variavel `${PLATAFORMA}` você define o tipo de plataforma destinado a usar essa imagem por exemplo:
- usar __`linux/arm64`__ para arquitetura arm64.
- ou numa arquitetura x86_64 __`linux/amd64`__.

Podendo também usar ambas da seguinte forma __`linux/arm64,linux/amd64`__. Lembre-se de caso use mais de uma plataforma, separar elas por virgula.

Antes da tag temos a variável `${DOCKER_REGISTRY}` que serve pra indicar ao Docker a URL do Docker Registry caso você pretenda subir esse imagem para outro que não seja o Docker Hub.

E por ultimo e mais importante, temos a variável `${DOCKER_IMAGE_WITH_TAG}` que como o nome já diz, é o nome da imagem docker com a tag que você deseja gerar.

---
### Por fim, caso queira subir ela para um registry customizado basta executar:
```shell script
$ docker push ${DOCKER_REGISTRY}/${DOCKER_IMAGE_WITH_TAG}
```
---
## Observações finais
O arquivo [build_image.sh](./build_image.sh) é o que eu uso para gerar localmente para a __arquitetura arm64__ subindo pro __Docker Registry local__.