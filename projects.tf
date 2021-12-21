#Create a CodeBuildProject for Plan
resource "aws_codebuild_project" "plan-project" {
  name         = "plan-project"
  description  = "Plan stage for terraform"
  service_role = aws_iam_role.test-codebuild-role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "hashicorp/terraform:0.14.3"
    type         = "LINUX_CONTAINER"
  }
  source {
    type      = "CODEPIPELINE"
    buildspec = file("buildspec/plan.yml")
  }

}
#Create a CodeBuildProject for Apply
resource "aws_codebuild_project" "apply-project" {
  name         = "apply-project"
  description  = "Apply stage for terraform"
  service_role = aws_iam_role.test-codebuild-role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "hashicorp/terraform:0.14.3"
    type         = "LINUX_CONTAINER"
  }
  source {
    type      = "CODEPIPELINE"
    buildspec = file("buildspec/apply.yml")
  }

}
