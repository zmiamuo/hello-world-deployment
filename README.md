# Hello-World App deployment on Kubernetes

## Prerequisites

- Kubernetes cluster (local or cloud) you can use [minikube](https://minikube.sigs.k8s.io/docs/start/?arch=%2Fwindows%2Fx86-64%2Fstable%2F.exe+download) for starters.
- kubectl CLI (check this [documentation](https://kubernetes.io/docs/tasks/tools/) for installation.)
- Docker ([installation prerequisites and procedure](https://docs.docker.com/engine/install/))
- Helm ([installation prerequisites and procedure](https://helm.sh/docs/intro/install/))
- Ingress controller (if using Ingress : [installation prerequisites and procedure](https://docs.nginx.com/nginx-ingress-controller/installation/))

## Deploy & test the app

1. **Clone the repository** :
   ```bash
   git clone <repository-url>
   cd <repository-directory>
2. **Deploy on K8s** :
    ```bash
    kubectl apply -f ./manifests
3. **Access the Application**:
    - Get the external IP of the LoadBalancer service:
      ```bash
      kubectl get svc hello-world-service
      ```
    - Visit the IP in your browser.
    - If the Ingress is enabled and the hostname is set, you can directly type in the app's URL in your browser.
4. **Monitor Scaling**:
    - View HPA status:
      ```bash
      kubectl get hpa hello-world-hpa
      ```
    - Delete a pod:
        ```bash
      kubectl delete pod <pod-name>
      ```
    - Thanks to the "self-healing" that HPA allows us Kubernetes will automatically create a new pod to meet the desired state, ensuring high availability.
### Deploy using Helm
1. **Customize the values.yaml** with values of the set variables.(optional)
2. **Deploy the app using Helm**
      ```bash
      helm install hello-world-app ./helloworld-chart
      ```
## CI/CD
### Set variables
 Variables that need to be set for the build and deployment of the app are: 
| Variable                 | Description                            |
| --------------------- | -------------------------------------- |
| `DOCKER_USERNAME`        | username of your docker login          |
| `DOCKER_PWD`or `DOCKER_AUTH_TOKEN`        | your password or a generated token from your docker account (**to be set as a secret**)          |
| `KUBECONFIG`        |  The kubeconfig file is to imported from the K8s cluster where you intend to deploy your app, it contains the necessary information to authenticate and connect to your cluster (**to be set as a secret**)          |