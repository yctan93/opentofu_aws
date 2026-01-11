resource "aws_iam_role" "role" {
    assume_role_policy = var.iam_role.assume_role_policy
    description = var.description
    force_detach_policies = var.iam_role.force_detach_policies
    max_session_duration = var.iam_role.max_session_duration
    name = var.iam_role.name
    name_prefix = var.iam_role.name_prefix
    path = var.iam_role.path
    permissions_boundary = var.iam_role.permissions_boundary
    tags = var.tags
}

resource "aws_iam_policy_attachment" "test-attach" {
    name = join("-",["iam-role-assum", resource.aws_iam_role.role.name])
    users      = var.iam_role.assume_users
    roles      = [resource.aws_iam_role.role.name]
    groups     = var.iam_role.assume_groups
    policy_arn = var.iam_role.policy_arn
}