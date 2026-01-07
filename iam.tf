module "iam_users" {
    source = "./modules/iam_user"
    iam_users = var.iam_users
}