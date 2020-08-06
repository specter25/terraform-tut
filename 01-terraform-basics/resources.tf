
resource "aws_s3_bucket" "my_s3_bucket" {
    bucket = "my-s3-bucket-ujjwal-63874060"
    versioning {
        enabled = true
    }

}

resource "aws_iam_user" "my_iam_user_terra" {
    name = "my_iam_user_terra"
}
