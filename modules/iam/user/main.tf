resource "aws_iam_user" "user" {
    name = var.iam_user.name
    path = var.iam_user.path
    permissions_boundary = var.iam_user.permissions_boundary
    force_destroy = var.iam_user.force_destroy
    tags = var.iam_user.tags
}

