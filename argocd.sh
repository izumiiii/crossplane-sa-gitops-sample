##!/bin/bash


#
# Setup Argo CD projects
#
kubectl apply -f project-crossplane.yaml

#
# Deploy the Application that installs Crossplane and triggers the provisioning of an GCP SA
#
argocd app create --file application-crossplane.yaml

