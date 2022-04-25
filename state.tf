terraform {
  backend "s3" {
    bucket  = "back-s3-tfs"
    encrypt = true
    key     = "terraform.tfstate"
    region  = "eu-west-2"
  }
}
