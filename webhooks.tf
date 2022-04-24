
# # locals {
# #   SUPER_SECRET = "SUPER_SECRET"
# # }

# Create Pipeline Webhook trigger
resource "aws_codepipeline_webhook" "test-webhook" {
  name            = "test-webhook"
  authentication  = "GITHUB_HMAC"
  target_action   = "Source"
  target_pipeline = aws_codepipeline.test-pipeline.name

  authentication_configuration {
    secret_token = var.oauth_token
  }

  filter {
    json_path    = "$.ref"
    match_equals = "refs/heads/{Branch}"
  }
}

# resource "aws_codebuild_source_credential" "github" {
#   auth_type = "PERSONAL_ACCESS_TOKEN"
#   server_type = "GITHUB"
#   token = var.github_token
# }
# resource "github_repository" "aws-pipeline" {
#   name        = "kalabi1/aws-pipeline"
#     template {
#     owner      = "kalabi1"
#     repository = "aws-pipeline"
#   }
#   visibility = "public"
# }

# Create the CodePipeline webhook into a GitHub repository.
resource "github_repository_webhook" "git-webhook" {
  active     = true
  events     = ["push"]
  repository = var.repo_id
  configuration {
    url          = aws_codepipeline_webhook.test-webhook.url
    content_type = "json"
    insecure_ssl = true
    secret       = var.oauth_token
  }
}