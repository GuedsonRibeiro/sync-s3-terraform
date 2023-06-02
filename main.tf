# PROVIDER
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# REGION
provider "aws" {
    region = "us-east-1"
    shared_credentials_file = ".aws/credentials"
}

# BUCKET S3
resource "aws_s3_bucket" "s3-guedson" {
  bucket = "s3-guedson"
}

# STATIC SITE
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.s3-guedson.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

#S3 UPLOAD OBJECT
resource "aws_s3_bucket_object" "error" {
  key = "error.html"
  bucket = aws_s3_bucket.s3-guedson.id
  source = "error.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "cadastro-doador" {
  key = "cadastro-doador.html"
  bucket = aws_s3_bucket.s3-guedson.id
  source = "cadastro-doador.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "cadastro-organizazao" {
  key = "cadastro-organizazao.html"
  bucket = aws_s3_bucket.s3-guedson.id
  source = "cadastro-organizazao.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "doacoes" {
  key = "doacoes.html"
  bucket = aws_s3_bucket.s3-guedson.id
  source = "doacoes.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "index" {
  key = "index.html"
  bucket = aws_s3_bucket.s3-guedson.id
  source = "index.html"
  content_type = "text/html"
}

#S3 POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "S3Permissions",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:PutBucketPolicy",
                "s3:PutBucketAcl",
                "s3:CreateBucket",
                "s3:PutBucketVersioning"
            ],
            "Resource": [
                "arn:aws:s3:::s3-guedson",
                "arn:aws:s3:::s3-guedson/*"
            ]
        }
    ]
}


# VERSIONING S3 BUCKET
resource "aws_s3_bucket_versioning" "version" {
  bucket = aws_s3_bucket.s3-guedson.id
  versioning_configuration {
    status = "Enabled"
  }
}