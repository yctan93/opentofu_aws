variable "vpc" {
    type = object({
        name = string
        region = optional(string)
        cidr_block = string 
        instance_tenancy = optional(string, "default")
    })
}

variable "tags" {
    type = map(string)
    default = null
}