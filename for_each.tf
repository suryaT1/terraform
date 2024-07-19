provider "aws" {
  region = "sa-east-1"
}
/* resource "aws_instance" "ec2_machine" {
  ami = ""
  instance_type = "t2.micro"
} */
variable "users" {
  type = list(string)
  default = ["user-0","user-1","user-2","user-3","user-4"]
}
resource "aws_iam_user" "name" {
  for_each = toset(var.users)
  name = each.value
}
