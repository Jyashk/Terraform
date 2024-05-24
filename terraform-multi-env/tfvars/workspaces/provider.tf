terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.48.0"
    }
  }
  backend "s3"{
      bucket = "yash-bucket123"
      key = "yash-key-workspace"
      region = "us-east-1"
      dynamodb_table = "yash-locking"
  }
}

provider "aws" {
   region = "us-east-1"  
}
