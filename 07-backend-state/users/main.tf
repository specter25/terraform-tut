provider "aws" {
    region = "us-east-1"
    version= "~> 2.46"
}

resource "aws_iam_user" "my_iam_user_terra" {
    name = "my_iam_user_terra"
}
