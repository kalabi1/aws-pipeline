module "src" {
    source = "../modules/src"   
}
provider "aws" {
    region = "eu-west-2"
}