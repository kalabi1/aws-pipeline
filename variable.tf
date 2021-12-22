variable "codestar_connection" {
  default = "arn:aws:codestar-connections:eu-west-2:366346754316:connection/31122937-f58c-4696-b1dd-874db6338c56"
  type    = string
}

variable "github_token" {
  default = "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"
}

variable "repo_owner" {
  default = "kalabi"
}
variable "repo_branch" {
  default = "main"
}
variable "repo_name" {
  default = "aws-pipeline"
}
variable "repo_id" {
  default = "kalabi/aws-pipeline"
}