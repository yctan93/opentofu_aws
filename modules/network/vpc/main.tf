resource "aws_vpc" "vpc" {
    region = var.vpc.region
    cidr_block = var.vpc.cidr_block 
    instance_tenancy = var.vpc.instance_tenancy

    tags = merge({ Name = var.vpc.name }, var.tags)
}
