variable "iam_group" {
    type = object({
        name = string
        path = optional(string)
    })
}