terraform {
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "cloudnoot"
#
  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}
  cloud {
    organization = "cloudnoot"
    workspaces {
      name = "terra-house-1"
    }
  }
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.22.0"
    }
  }
}

provider "aws" {
  # Configuration options
}


provider "random" {
  # Configuration options
}


resource "random_string" "bucket_name" {
  lower   = true
  upper   = false
  length  = 16
  special = false
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "example" {
  # Bucke name rules
  # https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
  bucket = random_string.bucket_name.result
}


output "random_bucket_name_result" {
  value = random_string.bucket_name.result
}
