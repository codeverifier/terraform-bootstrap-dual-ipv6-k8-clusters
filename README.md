# Bootstrapping Dual IPv6 Kubernetes Clusters

This terraform project is for bootstrapping dual independent Kubernetes clusters in two respective VPCs. Resulting clusters along with the Kubernetes objects such as pods, services and nodes run on single stack IPv6.

This is mainly designed to validate two requirements,
- Multicluster support in Istio
- [Gloo Mesh](https://docs.solo.io/gloo-mesh/latest/) deployment with IPv6 capability

Additionally each cluster has its own NAT64/DNS64 VM to translate and handle any outbound traffic to IPv4 endpoints such as Github and DockerHub.

## Prerequisites

* AWS access
* Terraform 1.0.0+

## Instructions

### Provision

Simply run the following commands and go grab a cuppa until everything is provisioned.
```
terraform init
terraform apply
```

The output at the end should look like the following

```
primary_cluster_fqdn = "cluster-alpha.gl00.net"
primary_cluster_public_ip = "xxx.xxx.xxx.xxx"
secondary_cluster_fqdn = "cluster-beta.gl00.net"
secondary_cluster_public_ip = "xxx.xxx.xxx.xxx"
```

`kubectl` is pre-installed in each of the master VMs so you can SSH into each VM and verify the bootstrap.

For e.g.,
```
> kubectl get nodes -o wide
NAME              STATUS   ROLES                  AGE     VERSION   INTERNAL-IP                              EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION   CONTAINER-RUNTIME
ip-172-20-0-136   Ready    <none>                 2m57s   v1.21.2   2406:da18:e7d:c200:5276:2f87:1f8f:ce64   <none>        Ubuntu 20.04.2 LTS   5.8.0-1041-aws   containerd://1.4.9
ip-172-20-0-254   Ready    <none>                 2m54s   v1.21.2   2406:da18:e7d:c200:7f6d:759d:a704:e19b   <none>        Ubuntu 20.04.2 LTS   5.8.0-1041-aws   containerd://1.4.9
ip-172-20-0-68    Ready    control-plane,master   3m23s   v1.21.2   2406:da18:e7d:c200::64                   <none>        Ubuntu 20.04.2 LTS   5.8.0-1041-aws   containerd://1.4.9
```

### Destroy

To destroy both the clusters,
```
terraform destroy
```

## Addons

Currently, following addons are enabled by default:
* Storage class for automatic provisioning of persistent volumes
* Autoscaler

## Future Improvements

* Moving configuration to *.tfvar
* Being able to switch the bootstrap process between a single cluster and dual cluster