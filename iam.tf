module "iam_groups" {
    source = "./modules/iam/group"
    for_each = var.iam_groups
    iam_group = each.value
}

module "iam_users" {
    source = "./modules/iam/user"
    for_each = var.iam_users
    iam_user = each.value
}

module "groups_membership" {
    source = "./modules/iam/group_membership"
    for_each = var.groups_membership
    group_membership = each.value
    
    depends_on = [module.iam_groups, module.iam_users]
}
