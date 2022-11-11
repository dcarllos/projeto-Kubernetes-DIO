#!/bin/bash

echo "Criando as imagens.."

docker build -t davicarllos/projeto-backend:v1 backend/.
docker build -t davicarllos/projeto-database:v1 database/.


echo "Realizando push das imagens"
docker push davicarllos/projeto-backend:v1
docker push davicarllos/projeto-database:v1


echo "Criando serviços no cluster kubernetes.."

kubectl apply -f ./services.yaml


echo "Realizando o deployment..."

kubectl apply -f ./deployment.yaml
