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
resource "aws_s3_bucket" "s3-bucket-guedson2" {
  bucket = "s3-bucket-guedson2"
}

# STATIC SITE
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.s3-bucket-guedson2.id

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
  bucket = aws_s3_bucket.s3-bucket-guedson2.id
  source = "error.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "cadastro-doador" {
  key = "cadastro-doador.html"
  bucket = aws_s3_bucket.s3-bucket-guedson2.id
  source = "cadastro-doador.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "cadastro-organizacao" {
  key = "cadastro-organizacao.html"
  bucket = aws_s3_bucket.s3-bucket-guedson2.id
  source = "cadastro-organizacao.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "doacoes" {
  key = "doacoes.html"
  bucket = aws_s3_bucket.s3-bucket-guedson2.id
  source = "doacoes.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "index" {
  key = "index.html"
  bucket = aws_s3_bucket.s3-bucket-guedson2.id
  source = "index.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "main" {
  key = "main.js"
  bucket = aws_s3_bucket.s3-bucket-guedson2.id
  source = "main.js"
  content_type = "text/js"
}

resource "aws_s3_bucket_object" "styles_css" {
  key = "styles.css"
  bucket = aws_s3_bucket.s3-bucket-guedson2.id
  source = "styles.css"
  content_type = "text/css"
}

# VERSIONING S3 BUCKET
resource "aws_s3_bucket_versioning" "version" {
  bucket = aws_s3_bucket.s3-bucket-guedson2.id
  versioning_configuration {
    status = "Enabled"
  }
}
