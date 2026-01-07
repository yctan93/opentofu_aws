terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
  access_key = file("access_key")
  secret_key = file("secret_access_key")
  assume_role {
    role_arn = file("iam_role")
  }
}
