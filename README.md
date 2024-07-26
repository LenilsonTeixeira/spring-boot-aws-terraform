# Spring Boot AWS Terraform

![image](https://user-images.githubusercontent.com/12195255/221429977-009a9517-1177-4800-87df-e8a96750ef98.png)

## Pré-requisitos
- Terraform
- Docker


## Como executar

Configurar Credenciais da AWS com o comando: 
```
àws configure
```

Inicialmente é necessário buildar e construir a imagem docker executando o comando abaixo:
```
mvn spring-boot:build-image
```

Realizar push da imagem gerada para o Docker Hub

Na dentro da pasta **deploy/terraform** executar o comando:
```
terraform init
```

Para validar se está tudo ok com o provisionamento execute o comando:
```
terraform plan
```

Para realizar o provisionamento do ambiente execute o comando:

```
terraform apply
```



