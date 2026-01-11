
locals {
    iam_test_users = { for iam_user in csvdecode(file("./iam_onboarding/users/test_users/iam-users.csv")) : iam_user.name => iam_user}
    iam_test_groups = { for iam_group in csvdecode(file("./iam_onboarding/groups/test_groups/iam-groups.csv")) : iam_group.name => iam_group}
    iam_test_groups_memberships = { for iam_group_membership in csvdecode(file("./iam_onboarding/groups_memberships/iam-groups-memberships.csv")) : iam_group_membership.group_name => {
                                        group_name = iam_group_membership.group_name
                                        /* 
                                            Converts the users column from string to list(string)
                                            trimspace removes the white spaces in the string
                                        */
                                        users = [for user in split(",", iam_group_membership.users) : trimspace(user)] 
                                    }
                                  }
}

module "iam_test_groups" {
    source = "./modules/iam/group"
    for_each = local.iam_test_groups
    iam_group = each.value
}

module "iam_test_users" {
    source = "./modules/iam/user"
    for_each = local.iam_test_users
    iam_user = each.value
}

module "iam_test_uers_groups_membership" {
    source = "./modules/iam/group_membership"
    for_each = local.iam_test_groups_memberships
    group_membership = each.value
    
    depends_on = [module.iam_test_groups, module.iam_test_users]
}
