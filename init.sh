#!/bin/bash

# Prompt the user to choose between script1 and script2
PS3="Choose a script: "
options=("docker-install" "kubernetes-install" "Iptables" "Quit")

select opt in "${options[@]}"; do
  case $opt in
    "docker-install")
      # Script 1
      sudo apt-get update
      sudo apt-get install ca-certificates curl gnupg
      sudo install -m 0755 -d /etc/apt/keyrings
      curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
      sudo chmod a+r /etc/apt/keyrings/docker.gpg
      echo \
        "deb [arch=\"$(dpkg --print-architecture)\" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        $(. /etc/os-release && echo \"$VERSION_CODENAME\") stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
      sudo apt-get update
      sudo apt-get install containerd.io -y
      echo "Make changes in this path ----> /etc/containerd/config.toml"
      echo "Add the following lines to it:"
      echo "[plugins.\"io.containerd.grpc.v1.cri\".containerd.runtimes.runc]"
      echo "[plugins.\"io.containerd.grpc.v1.cri\".containerd.runtimes.runc.options]"
      echo "  SystemdCgroup = true"
      echo "sudo systemctl restart containerd"
      break
      ;;
    "kubernetes-install")
      # Script 2
      sudo apt-get update
      sudo apt-get install -y apt-transport-https ca-certificates curl
      sudo mkdir -p /etc/apt/keyrings
      curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-archive-keyring.gpg
      echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
      sudo apt-get update
      sudo apt-get install -y kubelet=1.26.0-00 kubeadm=1.26.0-00 kubectl=1.26.0-00
      sudo apt-mark hold kubelet kubeadm kubectl
source <(kubectl completion bash) # set up autocomplete in bash into the current shell, bash-completion package should be installed first.
echo "source <(kubectl completion bash)" >> ~/.bashrc 
alias k=kubectl
complete -o default -F __start_kubectl k
      break
      ;;
      
     "Iptables")
     cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

# sysctl params required by setup, params persist across reboots
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

# Apply sysctl params without reboot
sudo sysctl --system
lsmod | grep br_netfilter
lsmod | grep overlay
sysctl net.bridge.bridge-nf-call-iptables net.bridge.bridge-nf-call-ip6tables net.ipv4.ip_forward
sudo systemctl restart containerd
;;
    "Quit")
      # Quit the script
      echo "Exiting..."
      exit 0
      ;;
    *) echo "Invalid option. Please select a valid number." ;;
  esac
done

