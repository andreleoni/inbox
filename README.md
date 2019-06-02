# README

## Postgres

### Sets the database password secrets

```
kubectl create secret generic db-user-pass --from-literal=password=mysecretpass
kubectl create secret generic db-user --from-literal=username=postgres
```


### Set the postgres

```
kubectl create -f kube/postgres.yaml
```

## Rails setup

### Creates secrets for rails app

```
kubectl create secret generic secret-key-base --from-literal=secret-key-base=50dae16d7d1403e175ceb2461605b527cf87a5b18479740508395cb3f1947b12b63bad049d7d1545af4dcafa17a329be4d29c18bd63b421515e37b43ea43df64
```

```
$ kubectl create -f kube/rails_setup.yaml


$ kubectl get jobs

NAME    COMPLETIONS   DURATION   AGE
setup   0/1           10s        10s
```

## Deployment

```
kubectl create -f kube/deployment.yaml
```

## Ingress

```
$ minikube addons enable ingress
$ kubectl create -f kube/ingress.yaml
```

### Checks if ingress is running

```
$ kubectl -n kube-system get po -w
```

## Scaling manually

To scale with kubernetes, you could edit the replicas of deployment and increase the number of "replicas", so run the command `kubectl apply -f kube/deployment.yaml`

## Atualizar deploy

`kubectl apply -f kube/deployment.yaml`
