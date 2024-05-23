terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.48.0"
    }
  }
  backend "s3"{
      bucket = "yash-bucket"
      key = "yash-key"
      region = "us-east-1"
      dynamodb_table = "yash-locking"
  }
}

provider "aws" {
   region = "us-east-1"  
}
