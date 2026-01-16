test_vms = {
    test-ec2-1 = {
                    private_ips = ["172.16.10.100"]
                    name = "ec2-test-1"
                    nic_name = "ec2-test-1-nic"
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