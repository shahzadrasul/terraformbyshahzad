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

# Upload object to S3 bucket_a
resource "aws_s3_bucket_object" "image1" {
  for_each = fileset ("myfiles/","*")
  bucket = aws_s3_bucket.bucket_a
  key = each.value
  source = "myfiles/${each.value}"
  etag = filemd5 ("myfiles/${each.value}")
  
}

# # Copy from bucket_a to bucket_b
# resource "aws_s3_bucket "image1" {
#   provisioner "local-exec" {
#     command = "aws s3 cp ${var.bucket_prefix}-bucket_a ${var.bucket_prefix}-bucket_a --recursive"
#   }
# }
# 