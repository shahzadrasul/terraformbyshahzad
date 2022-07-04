# terraformbyshahzad
Welcome to the Git Hub page. This includes:

# S3 buckets written in Terraform
Created two S3 buckets namely: bucket_a and bucket_b 
# IAM users and roles written in Terraform
Created two S3 buckets namely: usera and userb 
# Lambda function written in Python to strip image from its exif data
A Lambda function that takes a .jpg/.jpeg image from bucket_a, removes the exif data and puts it in bucket_b.
# Jenkinsfile to run the Terraform job with Slack notification using GitHub webhook.
# SNS topic & SNS notifcation to take changes from S3 object put in S3 bucket for Lambda to build it's Python code.
