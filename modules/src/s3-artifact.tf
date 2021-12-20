#Create a bucket to store the pipeline artifacts
resource "aws_s3_bucket" "codepipeline-artifacts" {
  bucket = "codepipeline-artifacts"
  acl    = "private"
  force_destroy = true
}