provider "aws" {
    region = "sa-east-1"
    access_key = var.acc
    secret_key = var.sec
}
locals {
  default = ["surya","mahesh","sudheer"]
}

resource "aws_iam_user" "new_user" {
    name = local.default[count.index]
    count = length(local.default)
}
