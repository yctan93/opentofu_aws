variable "iam_role" {
    type = object({
        force_detach_policies = optional(bool, false)
        max_session_duration = optional(number)
        name = string
        name_prefix = optional(string)
        path = optional(string)
        permissions_boundary = optional(string)
        policy_document_statement_actions = list(string)
        policy_document_principals = object({
            type = string
            identifiers = list(string)
        })
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