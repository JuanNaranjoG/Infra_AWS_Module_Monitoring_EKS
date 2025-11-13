terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.90.0"
    }
  }
}
#provider "aws" {
 # assume_role {
  #  role_arn = "arn:aws:iam::153126438600:role/jenkins-role-lz-bocc-aws-sandbox"
  #}
  #region = "us-east-1"
#}