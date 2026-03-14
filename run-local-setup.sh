#!/bin/bash
kind delete cluster --name jobportal

echo "Creating kind cluster..."
kind create cluster --name jobportal --config kind-config.yaml

echo "Installing ArgoCD..."
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl wait --for=condition=ready pod --all -n argocd --timeout=180s
kubectl port-forward svc/argocd-server -n argocd 9090:443

echo "Applying ArgoCD app..."
kubectl apply -f k8s/argocd-app.yaml