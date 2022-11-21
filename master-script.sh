#!/bin/bash

# Launch web server
sudo apt-get update -y
sudo apt-get dist-upgrade -y
sudo apt-get install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2
echo "${file_content}!" > /var/www/html/index.html

# # Docker Install
# sudo apt-get update
# sudo apt-get install ca-certificates curl gnupg lsb-release -y
# sudo mkdir -p /etc/apt/keyrings
# curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# sudo sed -i 's/debian/ubuntu/g' /etc/apt/sources.list.d/docker.list
# sudo apt-get update
# sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

# echo "Docker installed" > /var/www/html/index.html

# # Git Install
# sudo apt-get install git-all -y
# sudo git clone https://github.com/Mirantis/cri-dockerd.git

# echo "Git installed" > /var/www/html/index.html

# # Install GO
# sudo sed -i 's/#$nrconf{restart} = '"'"'i'"'"';/$nrconf{restart} = '"'"'a'"'"';/g' /etc/needrestart/needrestart.conf
# sudo apt install golang -y

# echo "Go installed" > /var/www/html/index.html

# Installing cri-docker
# cd /cri-dockerd
# sudo mkdir bin
# go build -o bin/cri-dockerd
# mkdir -p /usr/local/bin
# sudo install -o root -g root -m 0755 bin/cri-dockerd /usr/local/bin/cri-dockerd
# sudo cp -a packaging/systemd/* /etc/systemd/system
# sudo sed -i -e 's,/usr/bin/cri-dockerd,/usr/local/bin/cri-dockerd,' /etc/systemd/system/cri-docker.service
# sudo systemctl daemon-reload
# sudo systemctl enable cri-docker.service
# sudo systemctl enable --now cri-docker.socket

# echo "cri-docker installed" > /var/www/html/index.html

# # Installing kubeadm
# sudo apt-get update
# sudo apt -y remove needrestart
# sudo apt-get install -y apt-transport-https ca-certificates curl
# sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
# echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
# sudo apt-get update
# sudo apt-get install -y kubelet kubeadm kubectl
# sudo apt-mark hold kubelet kubeadm kubectl

# echo "kubeadm installed" > /var/www/html/index.html

# # Initiate cluster
# sudo kubeadm init --pod-network-cidr=10.0.0.0/16 --cri-socket=unix:///var/run/cri-dockerd.sock --ignore-preflight-errors=all
# mkdir -p $HOME/.kube
# sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
# sudo chown $(id -u):$(id -g) $HOME/.kube/config

# # echo "Cluster initiated" > /var/www/html/index.html

# # # Initiate cluster 2
# sudo kubeadm init --pod-network-cidr=10.0.0.0/16 --cri-socket=unix:///var/run/cri-dockerd.sock --ignore-preflight-errors=all
# mkdir -p $HOME/.kube
# sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
# sudo chown $(id -u):$(id -g) $HOME/.kube/config

# echo "Cluster initiated 2" > /var/www/html/index.html

# # Calico for networking
# curl https://raw.githubusercontent.com/projectcalico/calico/v3.24.5/manifests/calico.yaml -O
# kubectl apply -f calico.yaml

# echo "Calico installed" > /var/www/html/index.html

# # Installing Dashboard
# kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.6.1/aio/deploy/recommended.yaml

# echo "Dashboard. Done" > /var/www/html/index.html

# # Untaint master node to deploy to master
# kubectl taint node ip-10-0-101-42 node-role.kubernetes.io/control-plane:NoSchedule-     

# echo "All Done" > /var/www/html/index.html