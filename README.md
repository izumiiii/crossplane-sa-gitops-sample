# crossplane, GCP, ArgoCD tutorial

## setup

### minikube

```bash
minikube start

minikube addons enable ingress
```

### crossplane

[Install crossplane](https://crossplane.io/docs/v1.10/getting-started/install-configure.html#install-crossplane)
[Setup GCP configuration](https://crossplane.io/docs/v1.10/getting-started/install-configure.html#install-crossplane)

### Create SA

```bash
kubectl apply -f crossplane/sa.yaml
```

### ArgoCD

#### ArgoCD Install

```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

#### Port Forwarding

```bash
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

#### Login ArgoCD

```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo # get password

argocd login localhost:8080
```

#### Update Password

```bash
argocd account update-password
```

#### Add Private Repository

```bash
argocd repo add git@github.com:argoproj/argocd-example-apps.git --ssh-private-key-path ~/.ssh/id_rsa
```

#### Deploy Argo Project and Application

```bash
sh argocd.sh
```
