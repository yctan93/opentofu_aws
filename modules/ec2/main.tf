data "aws_ami" "ami" {
    most_recent = var.ec2.ami_most_recent
    name_regex = var.ec2.ami_name_regex
    owners = var.ec2.ami_owners

    dynamic "filter" {
        for_each = var.ec2.ami_filters
        content {
            name = filter.value["name"] 
            values = filter.value["values"]
        }
    }
}

resource "aws_network_interface" "nic" {
    subnet_id   = var.ec2.subnet_id
    private_ips = var.ec2.private_ips

    tags = merge({ Name = var.ec2.nic_name }, var.tags)
}

resource "aws_instance" "ec2" {
    ami           = data.aws_ami.ami.id
    instance_type = var.ec2.instance_type

    primary_network_interface {
        network_interface_id = aws_network_interface.nic.id
    }

    cpu_options {
        core_count       = var.ec2.cpu_options_core_count
        threads_per_core = var.ec2.cpu_options_threads_per_core
    }
    tags = merge({ Name = var.ec2.name }, var.tags)
}

