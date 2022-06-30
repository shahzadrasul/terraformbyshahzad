output "s3_bucket_name" {
  value = aws_s3_bucket.bucket_a.id
}
output "s3_bucket_region" {
    value = aws_s3_bucket.bucket_b.region
}
