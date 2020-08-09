variable "environment"{
    default="default"
}

provider "aws" {
    region = "us-east-1"
    version= "~> 2.46"
}

resource "aws_iam_user" "my_iam_user_terra" {
    name = "${local.iam_user_extention}_${var.environment}"
}


locals {
    iam_user_extention= "my_iam_user_terra"
}