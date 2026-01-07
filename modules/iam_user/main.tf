resource "aws_iam_user" "this" {
    for_each = var.iam_users
    name = each.value.iam_user_name
    path = each.value.iam_user_path
    tags = each.value.iam_user_tags
}