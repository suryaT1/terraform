provider "aws" {
    access_key = var.acc
    secret_key = var.sec
    region = "sa-east-1"
}
data "aws_instance" "name1" {}  #trying to fecth ec2 data

 output "instance_name1" {      #printing the ec2 value
  value = data.aws_instance.name11.id
 }
 
 resource "aws_instance" "new_machine" {  #creating new ec2 machine using existing ec2 machine details 

  ami = data.aws_instance.name11.ami   #calling name1 ami ID
  instance_type = data.aws_instance.name11.instance_type   #calling name1 instance type
}
