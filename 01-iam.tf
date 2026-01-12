
locals {
    iam_test_groups = { for iam_group in csvdecode(file("./iam_onboarding/groups/test_groups/iam-groups.csv")) : iam_group.name => {
                            name = iam_group.name
                            path = iam_group.path == "" ? null : iam_group.path
                        }
                    }


    iam_test_users = { for iam_user in csvdecode(file("./iam_onboarding/users/test_users/iam-users.csv")) : iam_user.name => {
                            name = iam_user.name
                            path = iam_user.path == "" ? null : iam_user.path
                            permissions_boundary = iam_user.permissions_boundary == "" ? null : iam_user.permissions_boundary
                            force_destroy = iam_user.force_destroy
                            create_access_key = iam_user.create_access_key
                        }
                    }

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

# IAM: Groups
module "iam_test_groups" {
    source = "./modules/iam/group"
    for_each = local.iam_test_groups
    iam_group = each.value
}

# IAM: Users
module "iam_test_users" {
    source = "./modules/iam/user"
    for_each = local.iam_test_users
    iam_user = each.value
}

# IAM: Group Memberships
module "iam_test_uers_groups_membership" {
    source = "./modules/iam/group_membership"
    for_each = local.iam_test_groups_memberships
    group_membership = each.value
    
    depends_on = [module.iam_test_groups, module.iam_test_users]
}

# IAM: Custom Managed Policy
module "test_policy" {
    source = "./modules/iam/policies"
    iam_policy = {
        name = var.iam_test_policy_name
        path = var.iam_test_policy_path
        policy = jsonencode(var.iam_test_policy_policy)
    }
    description = "Policy to list and get users"
}

# IAM: Roles
module "test_role_assume" {
    source = "./modules/iam/role"
    iam_role = {
        name = "iam_test_role_assume"
        policy_document_statement_actions = ["sts:AssumeRole"]
        policy_document_principals = {
                                        type        = "Service"
                                        identifiers = ["ec2.amazonaws.com"]
                                    }
        policy_arn = module.test_policy.policy_info.arn
    }
    depends_on = [module.test_policy.policy_info]
}
