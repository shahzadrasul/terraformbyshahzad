provider "aws" {
  region = var.aws_region
}
#source bucket provider
resource "aws_s3_bucket" "bucket_a" {
  bucket = "${var.bucket_prefix}-bucket-a"
   versioning {
    enabled = var.versioning
  }
  
  tags = var.tags
}

resource "aws_s3_bucket_policy" "bucket_a" {
  bucket = aws_s3_bucket.bucket_a.id
  policy = data.aws_iam_policy_document.user_a_permissions.json
}

#destination bucket provider
resource "aws_s3_bucket" "bucket_b" {
  bucket = "${var.bucket_prefix}-bucket-b"
  # policy = data.aws_iam_policy_document.user_b_permissions.json
  
   versioning {
    enabled = var.versioning
  }
  
  tags = var.tags
}


resource "aws_s3_bucket_policy" "bucket_b" {
  bucket = aws_s3_bucket.bucket_b.id
  policy = data.aws_iam_policy_document.user_b_permissions.json
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a 
  # path.module in the filename.
  filename      = "./lambda/lambda.py.zip"
  function_name = "lambda_s3_exifconvert"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "lambda_function.handler"
  runtime       = "python3.6"

}

resource "aws_sns_topic" "topic" {
  name = "s3-event-notification-topic"

  policy = <<POLICY
{
    "Version":"2012-10-17",
    "Statement":[{
        "Effect": "Allow",
        "Principal": { "Service": "s3.amazonaws.com" },
        "Action": "SNS:Publish",
        "Resource": "arn:aws:sns:*:*:s3-event-notification-topic",
        "Condition":{
            "ArnLike":{"aws:SourceArn":"${aws_s3_bucket.bucket_a.arn}"}
        }
    }]
}
POLICY
}


resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.bucket_a.id

  topic {
    topic_arn     = aws_sns_topic.topic.arn
    events        = ["s3:ObjectCreated:*"]
    filter_suffix = ".jpeg"
  }
}

resource "aws_sns_topic_subscription" "user_updates_lambda_target" {
  topic_arn = aws_sns_topic.topic.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.test_lambda.arn
}

