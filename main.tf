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


variable "img" {
  type = string
  default = "multiple-s3-files"
  
}
resource "aws_s3_bucket_object" "base_folder" {
  bucket = aws_s3_bucket.s3-guedson.id
  key = "${var.img}/"
  acl = "public-read"
  content_type = "application/x-directory"
}

resource "aws_s3_bucket_object" "S3Objects-inside-dir" {
  bucket = aws_s3_bucket.s3-guedson.id
  for_each = fileset("C:\\Users\\DELL\\OneDrive\\Área de Trabalho\\Portifólio\\sync-s3-terraform\\img", "*")
  key = "${var.img}/${each.value}"
  acl = "public-read"
  source = "C:\\Users\\DELL\\OneDrive\\Área de Trabalho\\Portifólio\\sync-s3-terraform\\img\\${each.value}"

  etag = filemd5("C:\\Users\\DELL\\OneDrive\\Área de Trabalho\\Portifólio\\sync-s3-terraform\\img\\${each.value}"
)
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