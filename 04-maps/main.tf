variable "users" {
  #initially the map was a normal value
  # default = {
  #     ujjwal123 :"Spain",
  #     mansha : "Netherlands",
  #     mudit : "India"
  # }

  #now the map is mapped to a  map
  default = {
    ujjwal123 : { country : "Spain", Department : "ABC" },
    mansha : { country : "Netherlands", Department : "ABC" },
    mudit : { country : "India", Department : "ABC" }

  }
}

provider "aws" {
  region  = "us-east-1"
  version = "~> 2.46"
}

resource "aws_iam_user" "my_iam_user_terra" {

  for_each = var.users
  name     = each.key
  tags = {
    # case 1
    # country:each.value

    # case2
    country : each.value.country,
    Department : each.value.Department
  }


}
