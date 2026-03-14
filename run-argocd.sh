echo "Getting ArgoCD password..."
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

echo "Done! ✅"
echo "ArgoCD UI: https://localhost:9090"
echo "App: http://localhost:8080"

kubectl port-forward svc/argocd-server -n argocd 9090:443

