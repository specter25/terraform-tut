variable "iam_user_name_prefix" {
    type = string
    default = "my_iam_user_terra"
}

provider "aws" {
    region = "us-east-1"
    version= "~> 2.46"
}

resource "aws_iam_user" "my_iam_user_terra" {
    count =3
    name = "${var.iam_user_name_prefix}_${count.index}"
}
