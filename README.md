Master Node:

```ufw disable
sudo kubeadm init --pod-network-cidr=10.0.0.0/16 --cri-socket=unix:///var/run/cri-dockerd.sock --ignore-preflight-errors=all
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
curl https://raw.githubusercontent.com/projectcalico/calico/v3.24.5/manifests/calico.yaml -O
kubectl apply -f calico.yaml```


kubectl taint node  ip-10-0-101-143 node-role.kubernetes.io/control-plane:NoSchedule-  

kubectl create deployment web --image=gcr.io/google-samples/hello-app:1.0
kubectl expose deployment web --type=NodePort --port=8080


Worker Node:

ufw disable
kubeadm join <NODE> --token <TOKEN> \
        --discovery-token-ca-cert-hash <HASH> \
        --cri-socket=unix:///var/run/cri-dockerd.sock