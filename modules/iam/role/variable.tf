variable "iam_role" {
    type = object({
        assume_role_policy = string
        force_detach_policies = optional(bool, false)
        max_session_duration = optional(number)
        name = string
        name_prefix = optional(string)
        path = optional(string)
        permissions_boundary = optional(string)
        policy_arn = string

        assume_users = optional(list(string))
        assume_groups = optional(list(string))
    })
}

variable "description" {
    type = string
    default = null
}

variable "tags" {
    type = map(string)
    default = null
}