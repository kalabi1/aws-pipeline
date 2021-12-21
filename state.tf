terraform {
  backend "s3" {
    bucket  = "back-s3-tf"
    encrypt = true
    key     = "terraform.tfstate"
    region  = "eu-west-2"
  }
}

provider "aws" {
  region = "eu-west-2"
}