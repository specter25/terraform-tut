provider "aws" {
    region = "us-east-1"
    version= "~> 2.46"
}

resource "aws_s3_bucket" "my_s3_bucket" {
    bucket = "my-s3-bucket-ujjwal-63874060"
    versioning {
        enabled = true
    }

}

resource "aws_iam_user" "my_iam_user_terra" {
    name = "my_iam_user_terra"
}

output "my_s3_bucket_versioning" {
    value = aws_s3_bucket.my_s3_bucket.versioning[0].enabled
}