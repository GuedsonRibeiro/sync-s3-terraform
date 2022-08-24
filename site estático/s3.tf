#provider 
resource "aws_s3_bucket" "b" {
	bucket = "static-site-guedson"
}

resource "aws_s3_bucket_acl" "b-acl" {
	bucket 	= aws_bucket.b.id
	acl 	= "public-read"
}

resource "aws_s3_bucket_versioning" "b-versioning" {
	bucket  	= aws_bucket.b.id
	versioning_configuration {
		statuts = "Enabled"
}
}

resource "aws_s3_bucket_website_configuration" "b-website" {
	bucket  	= aws_bucket.b.id
	index_document {
		suffix 	= "index.html"
}
	error_document {
		key 	= "error.html"
}
}
resource "aws_s3_bucket_object" "b-objects" {
	bucket  	= aws_bucket.b.id
	for_each 	= fileset("data/", "*")
	key 		= each.value
	source		= "data/${each.value}"
	acl 		= "public-read"
}

