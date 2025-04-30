terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.96.0"
    }
  }

  backend "s3" {
    bucket         = "tws-junoon-state-bucket-remote"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "tws-junoon-state-table"
  }
}