provider "aws" {
  region = "sa-east-1"
}

variable "ami" {
  default = "ami-0d1caeff4d404588d"    #please provive valid AMI ID
}
locals {                 #using locals to get the instance type size based on the workspaces 
  workspaces = {         # map data type 
    dev = "t2.micro"
    test = "t2.nano"
    prod = "t2.large"
  }
}
resource "aws_instance" "ec2_machine" {
   instance_type = local.workspaces[terraform.workspace]   #calling locals with respect to workspace --- > terraform.workspace it will fetch the which workspace we are in
   ami = var.ami    #update ami ID   #fetching local id from variables
}
