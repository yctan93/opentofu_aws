iam_groups = {
    "iam-group-1" = {
        name = "iam-group-1"
        path = null
    }
    "iam-group-2" = {
        name = "iam-group-2"
        path = "/test/"
    }
}

iam_users = {
    "iam-user-1" = {
        name = "iam-user-1"
        path = null
        permissions_boundary = null
        force_destroy = null
        tags = null
    }
    "iam-user-2" = {
        name = "iam-user-2"
        path = "/test/"
        permissions_boundary = null
        force_destroy = null
        tags = null
    }
    "iam-user-3" = {
        name = "iam-user-3"
        path = "/test/"
        permissions_boundary = null
        force_destroy = null
        tags = null
    }
}

groups_membership = {
    "iam-group-1" = {
        group_name = "iam-group-1"
        users = ["iam-user-1"]
    }
    "iam-group-2" = {
        group_name = "iam-group-2"
        users = ["iam-user-2", "iam-user-3"]
    }
}