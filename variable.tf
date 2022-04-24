variable "codestar_connection" {
  default = "arn:aws:codestar-connections:eu-west-2:627874023416:connection/a31cfbe6-9772-408c-8e3b-28cdf8d51192"
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
  default = "kalabi1/aws-pipeline"
}