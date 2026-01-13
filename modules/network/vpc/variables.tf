variable "vpc" {
    type = object({
        name = string
        region = optional(string)
        cidr_block = string 
        instance_tenancy = optional(string, "default")
        ipv4_ipam_pool_id = optional(string)
        ipv4_netmask_length = optional(number)
        enable_dns_support = optional(bool, true)
        enable_network_address_usage_metrics = optional(bool, false)
        enable_dns_hostnames = optional(bool, false)
    })
}

variable "tags" {
    type = map(string)
    default = null
}