terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.97.0"
    }
  }

  backend "s3" {
    bucket = "my-s3state-bucket"
    key = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "tws-statemg-table"
  }
}