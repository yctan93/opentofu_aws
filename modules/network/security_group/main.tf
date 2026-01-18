resource "aws_security_group" "security_group" {
    name = var.security_group.name
    description = var.security_group.description

    dynamic "egress" {
        for_each = var.security_group.egress != null ? var.security_group.egress : []
        content {
            from_port = egress.value.from_port
            to_port = egress.value.to_port
            protocol = egress.value.protocol 
            cidr_blocks = egress.value.cidr_blocks
            security_groups = egress.value.security_groups 
        }
    }

    dynamic "ingress" {
        for_each = var.security_group.ingress != null ? var.security_group.ingress : []
        content {
            from_port = ingress.value.from_port 
            to_port = ingress.value.to_port 
            protocol = ingress.value.protocol 
            cidr_blocks =  ingress.value.cidr_blocks
            security_groups = ingress.value.security_groups
        }
    }

    tags = var.tags
}