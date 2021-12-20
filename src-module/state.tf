terraform {
    backend "s3" {
        bucket = "backend-s3-tf"
        encrypt = true
        key = "terraform.tfstate"
        region = "eu-west-2"
    }
}

