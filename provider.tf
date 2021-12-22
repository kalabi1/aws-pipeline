# provider "github" {
#   token   = var.github_token
#   owner   = var.repo_owner
#   version = "~> 4.0.0"
# }

# provider "random" {
#   version = "~> 3.0.0"
# }

terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4"
    }
  }
}

# output "result" {
#   value  = random_string.github_secret.result
# }