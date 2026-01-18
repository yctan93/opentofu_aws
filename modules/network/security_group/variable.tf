variable "security_group" {
    type = object({
        name = string
        description = string

        egress = optional(list(object({
            from_port = number
            to_port = number
            protocol = string
            cidr_blocks = optional(list(string))
            security_groups = optional(list(string))
        })))

        ingress = optional(list(object({
            from_port = number
            to_port = number
            protocol = string
            cidr_blocks = optional(list(string))
            security_groups = optional(list(string))
        })))
    })
}

variable "tags" {
    type = map(string)
    default = null
}