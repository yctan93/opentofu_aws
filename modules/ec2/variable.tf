variable "ec2" {
    type = object({
        name = string
        nic_name = string
        subnet_id = string
        private_ips = list(string)
        instance_type = string
        cpu_options_core_count = number
        cpu_options_threads_per_core = number

        ami_owners = list(string)
        ami_name_regex = optional(string)
        ami_most_recent = bool
        ami_filters = list(object({
            name = string
            values = list(string)
        }))
    })
}

variable "tags" {
    type = map(string)
    default = null
}
