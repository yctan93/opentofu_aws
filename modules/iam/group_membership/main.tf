resource "aws_iam_group_membership" "membership" {
    name = join("-",["iam", var.group_membership.group_name ,"membership"])

    users = var.group_membership.users
    group = var.group_membership.group_name
}
