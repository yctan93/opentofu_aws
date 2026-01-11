output "user_info" {
    value = aws_iam_user.user
}

output "user_access_key_info_id" {
    value = length(aws_iam_access_key.access_key) > 0? aws_iam_access_key.access_key[0].id : null
    sensitive = true
}

output "user_access_key_info_secret" {
    value = length(aws_iam_access_key.access_key) > 0? aws_iam_access_key.access_key[0].secret : null
    sensitive = true
}
