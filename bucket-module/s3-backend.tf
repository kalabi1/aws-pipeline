resource "aws_s3_bucket" "backend-s3-tf" {
  bucket = "backend-s3-tf"
  acl    = "private"
  force_destroy = true
}