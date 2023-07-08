
# On-Premises Kubernetes Setup using Vagrant

This repository contains code and instructions for setting up an on-premises Kubernetes cluster using Vagrant as the virtualization tool. The cluster consists of one master node and four worker nodes.

## Prerequisites

Before proceeding with the setup, make sure you have the following dependencies installed on your machine:

-   [Vagrant](https://www.vagrantup.com/) 
-   [VirtualBox](https://www.virtualbox.org/) 

## Getting Started

To get started with the on-premises Kubernetes setup, follow the steps below:

1.  Clone this repository to your local machine:
    
    
    `git clone https://github.com/tarunratan/kubernetes-on-prem.git 
    
2.  Navigate to the cloned repository:
    
    
    `cd kubernetes-on-prem.git` 
    
3.  Provision the virtual machines using Vagrant:
    
    
    `vagrant up` 
    
    This will create the master and worker nodes based on the Vagrantfile configuration.
    
4.  Once the provisioning is complete, you can verify the status of the virtual machines:
    
    
    `vagrant status` 
    
    Ensure that all the nodes are running and accessible.
    
5.  Access the Kubernetes master node:
    
    
    `vagrant ssh master` 
    
    From the master node, you can interact with the Kubernetes cluster using `kubectl` commands.
    
    -   Master Node IP: 192.168.0.1
6.  Accessing worker nodes:
    
    To access the worker nodes, use the following IPs:
    
    -   Worker 1 IP: 192.168.1.10
    -   Worker 2 IP: 192.168.1.11
    -   Worker 3 IP: 192.168.1.12
    -   Worker 4 IP: 192.168.1.13
    
    You can SSH into the worker nodes using the respective IP addresses.
    

## Usage

Here are some common tasks and commands you can perform with the Kubernetes cluster:

-   Deploying applications
-   Scaling deployments
-   Managing pods, services, and other Kubernetes resources

For detailed information on using Kubernetes, refer to the [Kubernetes documentation](https://kubernetes.io/docs/).

## Cleanup

To tear down the on-premises Kubernetes cluster and remove all associated virtual machines, use the following command:


`vagrant destroy -f` 


use bash init.sh to init the scripts and install dependencies in each vm
Init.sh usage --> Configuration Scripts:

This repository includes the following scripts that you can use for configuration:

-   **docker-install**: Installs Docker and sets up containerd.
    
-   **kubernetes-install**: Installs Kubernetes components (kubelet, kubeadm, kubectl).
    
-   **Iptables**: Configures required sysctl parameters and restarts containerd.

## Contributing

If you would like to contribute to this project, feel free to open issues or submit pull requests. Contributions are always welcome!

## License

This project is licensed under the [MIT License](https://chat.openai.com/c/LICENSE).
