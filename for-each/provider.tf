terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.48.0"
    }
  }
  backend "s3" {
    bucket         	   = "yash-bucket123"
    key              	   = "state/terraform.tfstate"
    region         	   = "us-east-1"
    encrypt        	   = true
    dynamodb_table = "yash-locking-1"
  }
}

provider "aws" {
   region = "us-east-1"  
}
