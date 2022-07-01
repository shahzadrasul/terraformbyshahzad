# terraformbyshahzad

WIP
Welcome to the Git Hub page.
This includes:
  - creation of two s3 buckets written in Terraform
  - creation of two IAM users and roles written in Terraform
  - a lambda function (to strip image from its exif data)
  - a jenkinsfile to run the job within Jenkins that runs Terraform commands to produces the resources specified (which also contains Slack notification for the three statuses: success, failure and aborted)
