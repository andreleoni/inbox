#!/bin/sh

kubectl create secret generic db-user-pass --from-literal=password=mysecretpass
kubectl create secret generic db-user --from-literal=username=postgres

kubectl create -f kube/postgres_setup.yaml

# rake docker:push_image

kubectl create secret generic secret-key-base --from-literal=secret-key-base=50dae16d7d1403e175ceb2461605b527cf87a5b18479740508395cb3f1947b12b63bad049d7d1545af4dcafa17a329be4d29c18bd63b421515e37b43ea43df64

kubectl create -f kube/rails_setup.yaml

kubectl create -f kube/deployment.yaml

minikube addons enable ingress

kubectl create -f kube/ingress.yaml

kubectl -n kube-system get po -w
