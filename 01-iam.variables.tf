variable "iam_test_policy_name" { type = string }
variable "iam_test_policy_path" { type = string }
variable "iam_test_policy_policy" {
    type = object({
      Version = string
      Statement = list(object({
        Action = list(string),
        Effect = string,
        Resource = string
      }))
    })
}