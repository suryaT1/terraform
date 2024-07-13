provider "aws" {
    region = "sa-east-1"
    access_key = var.acc
    secret_key = var.sec
}

variable "iam_name" {
    type = list(string) 
    default = ["suhas","sudhir","alias", "bob"]
}
resource "aws_iam_user" "name" {
    name = var.iam_name[count.index]
    count = length(var.iam_name)
  
}
