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

# ACL S3
resource "aws_s3_bucket_acl" "acl-pub" {
  bucket = aws_s3_bucket.s3-guedson.id

  acl = "public-read"
}

#S3 UPLOAD OBJECT
resource "aws_s3_bucket_object" "error" {
  key = "error.html"
  bucket = aws_s3_bucket.s3-guedson.id
  source = "error.html"
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "index" {
  key = "index.html"
  bucket = aws_s3_bucket.s3-guedson.id
  source = "index.html"
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "img" {
  for_each = fileset("img/", "*")
  bucket = aws_s3_bucket.s3-guedson.id
  key = each.value
  source = "img/${each.value}"
  etag = filemd5("img/${each.value}")
  acl = "public-read"
}

#S3 POLICY
resource "aws_s3_bucket_policy" "s3-policy-alb" {
  bucket = aws_s3_bucket.s3-guedson.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect     = "Allow",
        Principal  = "*",
        Action    = "s3:GetObject",
        Resource = "arn:aws:s3:::s3-guedson/*",
      }
    ]
	})
}

# VERSIONING S3 BUCKET
resource "aws_s3_bucket_versioning" "version" {
  bucket = aws_s3_bucket.s3-guedson.id
  versioning_configuration {
    status = "Enabled"
  }
}