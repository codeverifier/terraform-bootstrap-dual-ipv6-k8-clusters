output "primary_cluster_fqdn" {
  value = "${module.aws_ipv6_kubernetes.primary_cluster_fqdn}"
}

output "primary_cluster_public_ip" {
  value = "${module.aws_ipv6_kubernetes.primary_cluster_public_ip}"
}

output "secondary_cluster_fqdn" {
  value = "${module.aws_ipv6_kubernetes.secondary_cluster_fqdn}"
}

output "secondary_cluster_public_ip" {
  value = "${module.aws_ipv6_kubernetes.secondary_cluster_public_ip}"
}