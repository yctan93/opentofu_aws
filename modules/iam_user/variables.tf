variable "iam_users" {
    type = map(object({
        iam_user_name = string
        iam_user_path = optional(string)
        iam_user_tags = optional(map(string))
    }))
}

