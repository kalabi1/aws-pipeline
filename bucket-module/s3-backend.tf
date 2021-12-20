resource "aws_s3_bucket" "back-s3-tf" {
  bucket = "back-s3-tf"
  acl    = "private"
  force_destroy = true
}

provider "aws" {
    region = "eu-west-2"
}