resource "aws_iam_user" "user" {
    name = var.iam_user.name
    path = var.iam_user.path
    permissions_boundary = var.iam_user.permissions_boundary
    force_destroy = var.iam_user.force_destroy
    tags = var.tags
}

resource "aws_iam_access_key" "access_key" {
    count = var.iam_user.create_access_key ? 1 : 0
    user = aws_iam_user.user.name
}
