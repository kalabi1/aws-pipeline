#Create a bucket to store the pipeline artifacts
resource "aws_s3_bucket" "code-pipe-artifacts" {
  bucket        = "code-pipe-artifacts"
  acl           = "private"
  force_destroy = true
}