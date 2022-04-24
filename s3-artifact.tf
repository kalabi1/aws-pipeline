#Create a bucket to store the pipeline artifacts
resource "aws_s3_bucket" "code-pipe-artifacts" {
  bucket        = "code-pipe-artifacts"
  force_destroy = true
}
# S3 Bucket ACL
resource "aws_s3_bucket_acl" "s3_bucket_acl_jar" {
  bucket = aws_s3_bucket.code-pipe-artifacts.id
  acl    = "private"
}