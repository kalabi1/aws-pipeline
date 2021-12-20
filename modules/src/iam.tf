#Create role for codepipeline
resource "aws_iam_role" "test-codepipeline-role" {
  name = "test-codepipeline-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "codepipeline.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

#Create Policy doc in JSON 
data "aws_iam_policy_document" "test-pipeline-doc" {
    statement{
        sid = ""
        actions = ["codestar-connections:UseConnection"]
        resources = ["*"]
        effect = "Allow"
    }
    statement{
        sid = ""
        actions = ["cloudwatch:*", "s3:*", "codebuild:*"]
        resources = ["*"]
        effect = "Allow"
    }
}


# Create Policy for CodePipeline
resource "aws_iam_policy" "test-codepipeline-policy" {
    name = "test-codepipeline-policy"
    path = "/"
    description = "Pipeline policy"
    policy = data.aws_iam_policy_document.test-pipeline-doc.json
}

# Attach Policy to CodePipeline Role
resource "aws_iam_role_policy_attachment" "test-cicd-pipeline-attachment" {
    policy_arn = aws_iam_policy.test-codepipeline-policy.arn
    role = aws_iam_role.test-codepipeline-role.id
}




#  Create Role for CodeBuild
resource "aws_iam_role" "test-codebuild-role" {
  name = "test-codebuild-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}


#Create Policy doc in JSON for CodeBuild
data "aws_iam_policy_document" "test-codebuild-json" {
    statement{
        sid = ""
        actions = ["logs:*", "s3:*", "codebuild:*", "secretsmanager:*","iam:*"]
        resources = ["*"]
        effect = "Allow"
    }
}

#Create Policy for CodeBuild
resource "aws_iam_policy" "test-codebuild-policy" {
    name = "test-cicd-build-policy"
    path = "/"
    description = "Codebuild policy"
    policy = data.aws_iam_policy_document.test-codebuild-json.json
}
# Attach Role to CodeBuild Policy
resource "aws_iam_role_policy_attachment" "test-codebuild-attachment1" {
    policy_arn  = aws_iam_policy.test-codebuild-policy.arn
    role        = aws_iam_role.test-codebuild-role.id
}

resource "aws_iam_role_policy_attachment" "test-codebuild-attachment2" {
    policy_arn  = "arn:aws:iam::aws:policy/PowerUserAccess"
    role        = aws_iam_role.test1-codebuild-role.id
}