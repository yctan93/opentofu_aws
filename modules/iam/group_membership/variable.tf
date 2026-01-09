variable "group_membership" {
    type = object({
      group_name = string
      users = list(string)
    })
}