variable "iam_groups" {
    type = map(object({
        name = string
        path = string
    }))
}

variable "iam_users" {
    type = map(object({
        name = string
        path = string
        permissions_boundary = string
        force_destroy = bool
        tags = map(string)
    }))

    validation {
        condition     = alltrue([for user in var.iam_users : length(user.name) > 4 && startswith(user.name, "iam-")])
        error_message = "To enforce naming convention, naming should start with \"iam-\"."
    }
}

variable "groups_membership" {
    type = map(object({
      group_name = string
      users = list(string)
    }))
}
