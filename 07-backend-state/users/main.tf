variable application_name {
    default = "07-backend-state"
}
variable project_name {
    default = "users"
}
variable environmment {
    default = "dev"
}

terraform {
    backend "s3" {
        bucket="dev-application-name-backend-state-63874060"
        key = "07-backend-state-users-dev"
        region="us-east-1"
        dynamodb_table="dev-application-locks"
        encrypt=true
    }
    

}

provider "aws" {
    region = "us-east-1"
    version= "~> 2.46"
}

resource "aws_iam_user" "my_iam_user_terra" {
    name = "my_iam_user_terra"
}
