data "aws_iam_policy_document" "user_a_permissions" {
  statement {
    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:GetObjectAcl",
      "s3:ListBucket",
    ]

    principals  {
        type = "AWS"
        identifiers = ["${aws_iam_user.user_a.arn}"]
    }
          

    resources = ["arn:aws:s3:::my-s3bucket-bucket_a",
                  "arn:aws:s3:::my-s3bucket-bucket_a/*",
    ]
  }

  depends_on = [
    aws_iam_user.user_a
  ]
}

data "aws_iam_policy_document" "user_b_permissions" {
  statement {

    principals  {
        type = "AWS"
        identifiers = ["${aws_iam_user.user_b.arn}"]
    }

    actions = [
      "s3:GetObject",
      "s3:GetObjectAcl",
      "s3:ListBucket",
      "s3:PutObject"
    ]

    resources = ["arn:aws:s3:::my-s3bucket-bucket_b",
                  "arn:aws:s3:::my-s3bucket-bucket_b/*",
    ]
  }

    depends_on = [
      aws_iam_user.user_b
    ]
}