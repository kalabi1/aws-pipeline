# provider "github" {
#   token   = var.github_token
#   owner   = var.repo_owner
#   version = "~> 4.0.0"
# }

# provider "random" {
#   version = "~> 3.0.0"
# }

terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4"
    }
  }
}
provider "tfe" {
  hostname = var.hostname
  token    = var.token
  # version  = "~> 0.30.2"
}
# credentials_helper "example" {
#   args = []
# }
# credentials "app.terraform.io" {
#   token = var.terraform_login
# }

  terraform {
      backend "remote" {
        # The name of your Terraform Cloud organization.
        organization = "kenny_org"

        # The name of the Terraform Cloud workspace to store Terraform state files in.
        workspaces {
          name = "wordpress-demo"
        }
      }
    }
provider "aws" {
  region = "eu-west-2"
  # access_key = var.TF_SECRET_KEY
  # secret_key  = var.TF_ACCESS_KEY
}
# output "result" {
#   value  = random_string.github_secret.result
# }