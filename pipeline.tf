# Create a CodePipeline
resource "aws_codepipeline" "test-pipeline" {
  name     = "test-pipeline"
  role_arn = aws_iam_role.test-codepipeline-role.arn

  artifact_store {
    type     = "S3"
    location = aws_s3_bucket.code-pipe-artifacts.id
  }

  #Pull Source Code from Github
  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      output_artifacts = ["tf-code"]
       owner     = "AWS"
      provider  = "CodeStarSourceConnection"
      run_order = 1
      version   = "1"


      configuration = {
        FullRepositoryId = var.repo_id
        BranchName     =   var.repo_branch
        # OAuthToken           = var.github_token
        ConnectionArn        = var.codestar_connection
      }



    }
  }
  # Plan the resource to be applied in the next stage
  stage {
    name = "Plan"
    action {
      name            = "Build"
      category        = "Build"
      provider        = "CodeBuild"
      version         = "1"
      owner           = "AWS"
      input_artifacts = ["tf-code"]
      configuration = {
        ProjectName = "plan-project"
      }
    }
  }
  # Apply the Resources
  stage {
    name = "Deploy"
    action {
      name            = "Deploy"
      category        = "Build"
      provider        = "CodeBuild"
      version         = "1"
      owner           = "AWS"
      input_artifacts = ["tf-code"]
      configuration = {
        ProjectName = "apply-project"
      }
    }
  }

}