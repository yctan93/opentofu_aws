resource "aws_vpc" "vpc" {
    region = var.vpc.region
    cidr_block = var.vpc.cidr_block 
    instance_tenancy = var.vpc.instance_tenancy
    ipv4_ipam_pool_id = var.vpc.ipv4_ipam_pool_id
    ipv4_netmask_length = var.vpc.ipv4_netmask_length
    enable_dns_support = var.vpc.enable_dns_support
    enable_network_address_usage_metrics = var.vpc.enable_network_address_usage_metrics
    enable_dns_hostnames = var.vpc.enable_dns_hostnames

    tags = merge({ Name = var.vpc.name }, var.tags)
}
