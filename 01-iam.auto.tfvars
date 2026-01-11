iam_test_policy_name = "iam_list_get_users"
iam_test_policy_path = "/"
iam_test_policy_policy = ({ Version = "2012-10-17"
                            Statement = [
                                {
                                    Action = [
                                        "iam:ListUsers",
                                        "iam:GetUser"
                                    ]
                                    Effect   = "Allow"
                                    Resource = "*"
                                },
                            ]
                        })