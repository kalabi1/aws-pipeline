# Create a CodePipeline
resource "aws_codepipeline" "test-pipeline" {
    name = "test-pipeline"
    role_arn = aws_iam_role.test-codepipeline-role.arn

    artifact_store {
        type    =  "S3"
        location = aws_s3_bucket.code-pipe-artifacts.id
    }
    
    #Pull Source Code from Github
    stage {
        name = "Source"
        action{
            name = "Source"
            category = "Source"
            owner = "AWS"
            provider = "CodeStarSourceConnection"
            version = "1"
            output_artifacts = ["tf-code"]
            configuration = {
                FullRepositoryId = "kalabi1/aws-pipeline"
                BranchName   = "main"
                ConnectionArn = var.test-codestar
                OutputArtifactFormat = "CODE_ZIP"
            }
        }
    }
    # Plan the resource to be applied in the next stage
    stage {
        name ="Plan"
        action{
            name = "Build"
            category = "Build"
            provider = "CodeBuild"
            version = "1"
            owner = "AWS"
            input_artifacts = ["tf-code"]
            configuration = {
                ProjectName = "plan-project"
            }
        }
    }
    # Apply the Resources
    stage {
        name ="Deploy"
        action{
            name = "Deploy"
            category = "Build"
            provider = "CodeBuild"
            version = "1"
            owner = "AWS"
            input_artifacts = ["tf-code"]
            configuration = {
                ProjectName = "apply-project"
            }
        }
    }

}