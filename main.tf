locals {
  config = yamldecode(file("./config/config.yaml"))
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0"
    }
  }

  encryption {
    ## Step 1: Add the desired key provider:
    key_provider "pbkdf2" "my_key_provider_name" {
      passphrase = local.config.provider.encryptionPassphrase #file("./config/encryption_passphrase")
    }
    
    ## Step 2: Set up your encryption method:
    method "aes_gcm" "my_method_name" {
      keys = key_provider.pbkdf2.my_key_provider_name
    }

    state {
      ## Step 3: Link the desired encryption method:
      method = method.aes_gcm.my_method_name

      ## Step 4: Run "tofu apply".

      ## Step 5: Consider adding the "enforced" option:
      # enforced = true
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
  access_key = local.config.provider.accessKey
  secret_key = local.config.provider.secretAccessKey
  assume_role {
    role_arn = local.config.provider.iamRole
  }
}
