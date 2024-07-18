provider "aws" {
  region     = "sa-east-1"
 
}
resource "aws_iam_user" "lb" {
  name = "iamuser.${count.index}"
  count = 3                                    #count variable declared
  path = "/system/"
}
 
output "arns" {
  value = aws_iam_user.lb[0].arn
}
 
output "names" {
  value = aws_iam_user.lb[*].name
}
