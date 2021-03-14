modprobe br_netfilter
lsmod | grep br_netfilter
cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sysctl --system
yum update -y
amazon-linux-extras install docker -y
service docker start
systemctl enable docker.service
usermod -aG docker ec2-user
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
exclude=kubelet kubeadm kubectl
EOF

setenforce 0
sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config
yum install -y kubelet-1.18.1 kubeadm-1.18.1 kubectl --disableexcludes=kubernetes
systemctl enable --now kubelet
cat << EOF | tee kubeadm.yaml
---
apiVersion: kubeadm.k8s.io/v1beta2
kind: ClusterConfiguration
clusterName: K8s-cluster
kubernetesVersion: v1.18.1
networking:
 dnsDomain: cluster.local
 podSubnet: 10.244.0.0/16
 serviceSubnet: 10.96.0.0/12
apiServer:
 extraArgs:
   authorization-mode: Node,RBAC
   cloud-provider: aws
 timeoutForControlPlane: 4m0s
controllerManager:
 extraArgs:
   cloud-provider: aws
   configure-cloud-routes: "false"
---
apiVersion: kubeadm.k8s.io/v1beta2
kind: InitConfiguration
nodeRegistration:
 kubeletExtraArgs:
   cloud-provider: aws
EOF

sleep 120
kubeadm init --ignore-preflight-errors=NumCPU --upload-certs --config=kubeadm.yaml
#To start using your cluster, you need to run the following as a regular user:
 mkdir -p $HOME/.kube
 sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
 sudo chown $(id -u):$(id -g) $HOME/.kube/config
# Install flannel
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/2140ac876ef134e0ed5af15c65e414cf26827915/Documentation/kube-flannel.yml
echo DONE
kubectl get nodes
kubectl get pods -n kube-system -o wide
kubectl get pods -n kube-system
vi ~/.kube/config
systemctl status kubelet
clear
kubectl get nodes
kubectl aidasdeployment.yml
kubectl apply -f aidasdeployment.yml
vi deployment.yml
vi service.yml
kubectl apply -f deployment.yml 
kubectl apply -f service.yml 
kubectl get svc
kubectl get po -o wide
curl http://10.244.1.3/
vi service.yml 
kubectl apply -f service.yml 
kubectl apply -f deployment.yml 
kubectl get po -o wide
curl://10.244.1.3/
curl http://10.244.1.3/
kubectl get svc
kubectl get po -o wide
curl http://18.232.140.52:30010/
vi service.yml 
kubectl get po --show-labels
kubectl get svc
kubectl get po -o wide
kubectl get nodes -o wide
clear
vi service.yml 
vi deployment.yml 
k apply -f service.yml 
kubectl apply -f deployment.yml 
kubectl appy -f service.yml 
kubectl apply -f service.yml 
kubectl get po -o wide
kubectl get nodes -o wide
alias k="kubectl'

alias k="kubectl"
k get pod
clear
k delete -f service.yml
vi lb.yml
k apply -f lb.yml 
k get svc
k describe svc
k describe svc elb
vi deployment.yml 
vi lb.yml 
k get svc
k apply -f lb.yml 
k get svc
k delete -f lb.yml 
k apply -f lb.yml 
k get svc
k delete -f lb.yml 
vi deployment.yml 
vi deployment1.yml 
k apply -f deployment1.yml 
k apply -f lb.yml 
k get svc
vi service.yml 
vi lb.yml 
k get svc
k delete -f deployment.yml 
k delete -f deployment1.yml 
k delete -f lb.yml 
k delete -f deployment1.yml
k get pods
vi deployment1.yml
k apply -f deployment1.yml 
k apply -f lb.yml 
k get svc
k delete -f deployment1.yml
k delete -f lb.yml 
k get pod
k apply -f deployment1.yml 
k apply -f lb.yml 
k get svc
k describe elb
k get pod
k delete deployment1.yml
k delete -f deployment1.yml 
k delete -f deployment.yml 
ls
k delete -f deployment.yml 
k delete -f lb.yml 
ls
k delete -f deployment.yml 
vi deployment.yml
k apply -f deployment.yml 
k apply -f lb.yml 
k get svc
vi lb.yml 
k get svc
k get po -o wide
k delete po nginx-deployment-6b474476c4-cpxlp
k delete po nginx-deployment-6b474476c4-fr9nm 
k delete po nginx-deployment-6b474476c4-l2ff4 
k get po -o wide
vi lb.yml 
vi deployment1.yml 
k apply -f deployment1.yml
k apply -f lb.yml 
k get svc
vi service.yml 
cat service.yml 
vi service.yml 
k delete -f lb.yml 
k delete -f deployment.yml
k delete -f deployment1.yml 
k get pods
ls
clear
k get pods
ls
k delete -f service.yml 
cat kubeadm.yaml
clear
k get pods
k delete pod nginx-deployment-6b474476c4-xgr7g
k get pods
ls
k get pods
k delete -f deployment.yml 
cat deployment.yml 
k delete -f nginx-deployment-6b474476c4-jggz4 
k delete  nginx-deployment-6b474476c4-jggz4 
k delete pods  nginx-deployment-6b474476c4-jggz4 
k get pods
k stop nginx-deployment-6b474476c4-jggz4 
vi deployment.yml 
k delete -f deployment.yml 
k get pods
clear
ls
vi deployment.yml 
vi lb.yml 
k apply -f deployment.yml 
k apply -f lb.yml 
k get svc
k delete elb lb-service
k delete lb-service
k get svc
k apply -f service.yml 
k get svc
alias k="kubectl"
k apply -f deployyy.yml
clear
pwd
echo "# elb-exercise" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/arzidat/elb-exercise.git
git push -u origin mainclear
yum install git
echo "# elb-exercise" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/arzidat/elb-exercise.git
git push -u origin main
ls
git add .
git status
git commit -m "first commit"
git push
clear
kubectl apply -f deployment.yml 
kubectl apply -f lb.yml 
kubectl get svc
