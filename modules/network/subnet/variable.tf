variable "subnet" {
    type = object({
        vpc_id = string
        cidr_block = string
        availability_zone = string
        name = string
    })
}

variable "tags" {
    type = map(string)
    default = null
}