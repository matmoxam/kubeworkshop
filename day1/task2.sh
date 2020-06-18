# Create a namespace for our deployment
kubectl create namespace nginx

# Create a deployment that spins up a Nginx pod
kubectl -n nginx create deployment nginx --image=nginx

# Examine the deployment
kubectl -n nginx describe deployment nginx

# Examine the pod
kubectl -n nginx describe pod pod-name

# Create a service to access the deployment
kubectl -n nginx expose deployment/nginx --type="NodePort" --port 80

# Examine the service
kubectl -n nginx get svc

# Access the nginx instance via URL:
curl http://node-ip:node-port

# Scale up the number of instances
kubectl -n nginx scale deployments/nginx --replicas=4

# Update version
kubectl -n nginx set image deployment/nginx nginx=nginx:1.16.1 --record

# Check roll out status
kubectl -n nginx rollout status deployment.v1.apps/nginx

# Check deployment history
kubectl -n nginx rollout history deployment.v1.apps/nginx

# Check what changed for a version
kubectl -n nginx rollout history deployment.v1.apps/nginx --revision=2

# Roll back the last deployment
kubectl -n nginx rollout undo deployment.v1.apps/nginx

# Roll back to a specific deployment
kubectl -n nginx rollout undo deployment.v1.apps/nginx --to-revision=2
