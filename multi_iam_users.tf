provider "aws" {
    region = "sa-east-1"
    access_key = var.acc
    secret_key = var.sec
}
variable "user_list" {
    type = list(string)
    default = ["sudheer" ,"surya","mahesh"]
  
}
resource "aws_iam_user" "iam_user" {
  name = var.user_list[count.index]
  count = 3  #it is used for iteration (repeats the block based on value assigned)
}
