variable "iam_policy" {
    type = object({
        name_prefix = optional(string)
        name = string
        path = optional(string)
        policy = string
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