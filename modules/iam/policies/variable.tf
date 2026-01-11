variable "iam_policy" {
    type = object({
        description = optional(string)
        name_prefix = optional(string)
        name = string
        path = optional(string)
        policy = string
    })
}

variable "tags" {
    type = map(string)
    default = null
}