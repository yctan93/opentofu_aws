variable "iam_group" {
    type = object({
        name = string
        path = optional(string)
    })

    validation {
        condition     = length(var.iam_group.name) > 4 && startswith(var.iam_group.name, "iam-")
        error_message = "To enforce naming convention, naming should start with \"iam-\"."
    }
}