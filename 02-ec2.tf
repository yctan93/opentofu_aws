# VPC 
module "EC2_VPC_test" {
    source = "./modules/network/vpc"
    vpc = {
        name = "test-vpc"
        cidr_block = "172.16.0.0/16"
    }
}

# Subnet
module "EC2_subnet_test" {
    source = "./modules/network/subnet"
    subnet = {
        vpc_id = module.EC2_VPC_test.vpc_id
        cidr_block        = "172.16.10.0/24"
        availability_zone = "ap-southeast-1a"
        name = "test-subnet"
    }
}

# EC2 
module "EC2_test" {
    source = "./modules/ec2"
    for_each = var.test_vms
    ec2 = merge(each.value)
    subnet_id = module.EC2_subnet_test.subnet_id
    ec2_user_data = file("./ec2/ec2-user-data.sh")
}

module "test_security_group" {
    source = "./modules/network/security_group"
    security_group = {
        name = "test-sc"
        description = "test"
        ingress = [{
            from_port = 443
            to_port = 443
            cidr_blocks = ["0.0.0.0/0"]
            protocol = "tcp"
        }]
    }
}