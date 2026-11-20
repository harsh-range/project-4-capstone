terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_iam_user" "harsh_s3_read_user" {
  name = "harsh-s3-readonly-user"
}

resource "aws_iam_policy" "harsh_s3_read_policy" {
  name        = "HarshS3ReadAccessPolicy"
  description = "Provides read access to S3"
  policy      = var.harsh_s3_read_policy
}

resource "aws_iam_user_policy_attachment" "harsh_s3_read_user_attachment" {
  user       = aws_iam_user.harsh_s3_read_user.name
  policy_arn = aws_iam_policy.harsh_s3_read_policy.arn
}