# terraform {
#   backend "s3" {
#     bucket  = "back-s3-tfs"
#     encrypt = true
#     key     = "terraform.tfstate"
#     region  = "eu-west-2"
#   }
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