
# # locals {
# #   SUPER_SECRET = "SUPER_SECRET"
# # }

# # Create Pipeline Wobhook trigger
# resource "aws_codepipeline_webhook" "test-webhook" {
#   name            = "test-webhook"
#   authentication  = "GITHUB_HMAC"
#   target_action   = "Source"
#   target_pipeline = aws_codepipeline.test-pipeline.name

#   authentication_configuration {
#     secret_token = var.github_token
#   }

#   filter {
#     json_path    = "$.ref"
#     match_equals = "refs/heads/{Branch}"
#   }
# }

# # Create the CodePipeline webhook into a GitHub repository.
# resource "github_repository_webhook" "test-webhook" {
#   repository = var.repo_id
#   configuration {
#     url          = aws_codepipeline_webhook.test-webhook.url
#     content_type = "json"
#     insecure_ssl = true
#     secret       = var.github_token
#   }

#   events = ["push"]
# }