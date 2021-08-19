# ==================================================
# Outputs
# ==================================================
# ==================================================

output "primary_cluster_fqdn" {
  description = "Primary cluster DNS address"
  value       = aws_route53_record.primary_master_ns_main_record.fqdn
}

output "primary_cluster_public_ip" {
  description = "Primary cluster public IP for SSH access"
  value       = aws_instance.primary_master_node.public_ip
}

output "secondary_cluster_fqdn" {
  description = "Secondary cluster DNS address"
  value       = aws_route53_record.secondary_master_ns_main_record.fqdn
}

output "secondary_cluster_public_ip" {
  description = "Secondary cluster public IP for SSH access"
  value       = element(aws_instance.secondary_master_node.*.public_ip, 0)
}