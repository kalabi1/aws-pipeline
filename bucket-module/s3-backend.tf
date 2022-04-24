# S3 Bucket for Backend
resource "aws_s3_bucket" "back-s3-tfs" {
  bucket        = "back-s3-tfs"
  force_destroy = true
}
# S3 Bucket ACL
resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  bucket = aws_s3_bucket.back-s3-tfs.id
  acl    = "private"
}
# Region bucket
provider "aws" {
  region = "eu-west-2"
}