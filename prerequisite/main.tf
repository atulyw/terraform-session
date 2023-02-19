terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.55.0"
    }
  }
}

provider "aws" {
  region  = "eu-west-1"
  profile = "terraform-session"
}

resource "aws_s3_bucket" "this" {
  bucket = "terraform-session-cloudblitz"
  tags = {
    "Name"    = "terraform-session-cloudblitz"
    "User"    = "terraform"
    "Account" = "cloudblitz"
  }
}

