variable "iam_user" {
    type = object({
        name = string
        path = optional(string)
        permissions_boundary = optional(string)
        force_destroy = optional(string)
        tags = optional(map(string))
    })
}

