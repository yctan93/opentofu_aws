resource "aws_iam_policy" "policy" {
    description = var.iam_policy.description
    name_prefix = var.iam_policy.name_prefix
    name = var.iam_policy.name
    path = var.iam_policy.path
    policy = var.iam_policy.policy
    tags = var.tags
}
