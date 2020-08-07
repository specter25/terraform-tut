variable "names" {
    default = ["ujjwal123" , "mudit" ,"pranav" ,"mansha"]
}

provider "aws" {
    region = "us-east-1"
    version= "~> 2.46"
}

resource "aws_iam_user" "my_iam_user_terra" {
    # count used when we need to refernece with the indexes

    # count = length(var.names)
    # name = var.names[count.index]
    
    # for each when we want to index based on the value at the index
    for_each= toset(var.names)
    name=each.value


}
