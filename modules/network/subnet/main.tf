resource "aws_subnet" "my_subnet" {
    vpc_id            = var.subnet.vpc_id
    cidr_block        = var.subnet.cidr_block
    availability_zone = var.subnet.availability_zone

    tags = merge({ Name = var.subnet.name }, var.tags)
}