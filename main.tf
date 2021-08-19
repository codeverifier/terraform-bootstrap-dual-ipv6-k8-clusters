module "aws_ipv6_kubernetes" {
  source                        = "./modules/kubernetes"

  project_name                  = "ipv6-demo"
  aws_region                    = "ap-southeast-2"
  aws_zones                     = ["ap-southeast-2a"]
  primary_cluster_name          = "cluster-alpha"
  secondary_cluster_name        = "cluster-beta"
  ipv4_vpc_cidr                 = "172.20.0.0/16"
  enable_secondary_cluster      = true
  min_worker_count              = 2
  max_worker_count              = 2
  hosted_zone                   = "gl00.net"
  hosted_zone_private           = false
  s3_bootstrap_user_data_bucket = "demo-test-bootstrap-user-data"
  ssh_public_key                = "~/.ssh/aws_id_rsa.pub"

  tags = {
    owner = "soloio"
  }

  tags2 = [
    {
      key                 = "owner"
      value               = "soloio"
      propagate_at_launch = true
    },
    {
      key                 = "application"
      value               = "kubernetes"
      propagate_at_launch = true
    }
  ]
}