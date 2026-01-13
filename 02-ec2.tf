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
    ec2 = {
        subnet_id = module.EC2_subnet_test.subnet_id
        private_ips = ["172.16.10.100"]
        name = "test-ec2"
        nic_name = "test-ec2-nic"
        instance_type = "t3.micro"
        cpu_options_core_count = 1
        cpu_options_threads_per_core = 1

        ami_most_recent = true
        ami_owners = ["amazon"]
        ami_filters = [{
            name = "name"
            values = ["al2023-ami-2023.*-x86_64"]
        }]
    }
}