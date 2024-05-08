# Demo Applications to play with ArgoCD
1. Demo Bankapp
2. DVWA
3. geocentric-model
4. helioscentric-model
5. luna
6. nginx-app
7. solar-system

![image](https://github.com/ciro1212/ArgoCD/assets/60695457/8fafbe49-c712-4b00-8107-878664ed55ae)


## 1st ArgoCD needs to be installed (K8s)
In order to install Argo CD, you should first have a valid Kubernetes configuration set up with kubectl, from which you can ping your worker nodes. You can test this by running kubectl get nodes:
```
kubectl get nodes
```

Create a Namespace with:
```
kubectl create namespace argocd
```

Installing the manifests

```
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

Check the status of the installation:

```
kubectl get pods -n argocd
```

You can press Ctrl+C to exit the watch interface. You now have Argo CD running in your Kubernetes cluster! However, because of the way Kubernetes creates abstractions around your network interfaces, you won’t be able to access it directly without forwarding ports from inside your cluster. You’ll learn how to handle that in the next step.

Because Kubernetes deploys services to arbitrary network addresses inside your cluster, you’ll need to forward the relevant ports in order to access them from your local machine. Argo CD sets up a service named argocd-server on port 443 internally. Because port 443 is the default HTTPS port, and you may be running some other HTTP/HTTPS services, it’s common practice to forward those to arbitrarily chosen other ports, like 8080, like so:

```
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

```
brew install argocd
```

Generate an initial Password for the user:


```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```

Connect to the Webpage:

```
https://localhost:8080/
```

<img width="1483" alt="image" src="https://github.com/ciro1212/ArgoCD/assets/60695457/036aaa28-6cc1-406b-9eed-c03c2203a7e2">



