provider "aws" {
  region = var.aws_region
}

terraform {
  required_version = "<= 1.11.1" #Forcing which version of Terraform needs to be use
  required_providers {
    aws = {
      version = "<= 6.0.0" #Forcing which version of plugin needs to be used.
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket         = "pavankibucket"
    key            = "Ansible.tfstate"
    region         = "us-east-1"
    # dynamodb_table = "-terraform-locks"
    encrypt        = true
  }
}