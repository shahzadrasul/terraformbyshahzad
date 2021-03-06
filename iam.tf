resource "aws_iam_user" "user_a" {
  name = "usera"
  
}

resource "aws_iam_user" "user_b" {
  name = "userb"

}

resource "aws_iam_user_policy" "user_a" {
  name = "user_a_policy"
  user = aws_iam_user.user_a.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetObject",
        "s3:GetObjectAcl",
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_user_policy" "user_b" {
  name = "user_b_policy"
  user = aws_iam_user.user_b.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetObject",
        "s3:GetObjectAcl",
        "s3:ListBucket",
        "s3:PutObject"
      ],
      "Effect": "Allow",
      "Resource": [
          "${aws_s3_bucket.bucket_b.arn}/*"
      ]
    }
  ]
}
EOF
}