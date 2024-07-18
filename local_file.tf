provider "aws" {
  region = "sa-east-1"
}
resource "aws_iam_user" "this" {
  name = "demo-kplabs-user"
}
 
resource "aws_iam_user_policy" "lb_ro" {
  name = "demo-user-policy"
  user = aws_iam_user.this.name
  policy = file("./policies.json")                #using file module to fetch the policies which are saved on policies.json file in the same folder
} 
