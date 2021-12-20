module "src" {
    source = "../modules/src" 
    test-codestar = "arn:aws:codestar-connections:eu-west-2:366346754316:connection/2aef6825-ed66-4ae8-938a-67ea16e5f736"
}
provider "aws" {
    region = "eu-west-2"
}