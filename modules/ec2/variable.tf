variable "ec2" {
    type = object({
        name = string
        nic_name = string
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

    validation {
        condition     = length(var.ec2.name) > 4 && startswith(var.ec2.name, "ec2-")
        error_message = "To enforce naming convention, naming should start with \"ec2-\"."
    }
}

variable "subnet_id" {
    type = string
}

variable "ec2_user_data" {
    type = string
    default = null
}

variable "tags" {
    type = map(string)
    default = null
}
