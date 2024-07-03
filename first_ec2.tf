provider "aws" {
  region = "ap-south-1"
  access_key = ""
  secret_key = ""  
}
resource "aws_instance" "my_ec2_system" {
   ami = "ami-01376101673c89611"
   instance_type = "t2.micro"

   tags = {
  Name = "my_ec2_instance"
   }
}
