resource "aws_codestarconnections_connection" "test-codestar" {
  name          = "test-codestar"
  provider_type = "Github"
}