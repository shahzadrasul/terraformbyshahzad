provider "aws" {
  region = var.aws_region
  access_key = "----"
  secret_key = "----"
}
#source bucket provider
resource "aws_s3_bucket" "bucket_a" {
  bucket = "${var.bucket_prefix}-bucket_a"
  policy = data.aws_iam_policy_document.user_a_permissions.json
   versioning {
    enabled = var.versioning
  }
  
  tags = var.tags
}
#destination bucket provider
resource "aws_s3_bucket" "bucket_b" {
  bucket = "${var.bucket_prefix}-bucket_b"
  policy = data.aws_iam_policy_document.user_b_permissions.json
  
   versioning {
    enabled = var.versioning
  }
  
  tags = var.tags
}

