variable "iam_users" {
    type = map(object({
        iam_user_name = string
        iam_user_path = string
        iam_user_tags = map(string)
    }))

    validation {
        condition     = alltrue([for user in var.iam_users : length(user.iam_user_name) > 4 && startswith(user.iam_user_name, "iam-")])
        error_message = "To enforce naming convention, naming should start with \"iam-\"."
    }
}