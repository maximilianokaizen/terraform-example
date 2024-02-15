terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

locals {
  extra_tag = "extra-tag"
}

resource "aws_s3_bucket" "example" {
  bucket = "s3-example"
  acl    = "private"

  tags = {
    ExtraTag = local.extra_tag
  }
}
