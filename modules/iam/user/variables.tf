variable "iam_user" {
    type = object({
        name = string
        path = optional(string)
        permissions_boundary = optional(string)
        force_destroy = optional(string)
        create_access_key = bool
    })

    validation {
        condition     = length(var.iam_user.name) > 4 && startswith(var.iam_user.name, "iam-")
        error_message = "To enforce naming convention, naming should start with \"iam-\"."
    }
}

variable "tags" {
    type = map(string)
    default = null
}

