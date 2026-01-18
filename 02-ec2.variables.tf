variable "test_vms" {
    type = map(object({
        private_ips = list(string)
        name = string
        nic_name = string
        instance_type = string
        cpu_options_core_count = number
        cpu_options_threads_per_core = number 

        ami_most_recent = bool
        ami_owners = list(string)
        ami_filters = list(object({
            name = string
            values = list(string)
        }))
    }))
    
    default = null
}