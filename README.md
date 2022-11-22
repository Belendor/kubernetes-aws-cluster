Master Node:

`ufw disable`

`sudo kubeadm init --pod-network-cidr=10.0.0.0/16 --cri-socket=unix:///var/run/cri-dockerd.sock --ignore-preflight-errors=all`

`mkdir -p $HOME/.kube`

`sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config`

`sudo chown $(id -u):$(id -g) $HOME/.kube/config`

`kubectl apply -f https://raw.githubusercontent.com/antrea-io/antrea/main/build/yamls/antrea.yml`

Untain Master to deploy on it:
      

        kubectl taint node <MASTER NODE> node-role.kubernetes.io/control-plane:NoSchedule-

Worker Node:

`ufw disable`

`kubeadm join <NODE> --token <TOKEN> --discovery-token-ca-cert-hash <HASH> --cri-socket=unix:///var/run/cri-dockerd.sock`

Deploy Ngnix to Kubernetes:

`kubectl create deployment web --image=gcr.io/google-samples/hello-app:1.0`

`kubectl expose deployment web --type=NodePort --port=8080`

Access Nginx:

`kubectl get svc`

Check exposed port at `8080:<PORT>`

Access Nginx:

`<NODE PUBLIC IP>:<PORT>`
