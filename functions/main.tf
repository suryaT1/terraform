provider "aws" {
    access_key = var.acc
    secret_key = var.sec
    region = "eu-west-1"
}

variable "ami_ids" {
    type = map
    default = {
      eu-west-1 = "ami-001"
      eu-east-1 = "ami-002"
      eu-south-1 = "ami-003"
      eu-north-1 = "ami-004"
    }
}
locals {
  region = ["eu-west-1","eu-east-1","eu-south-1","eu-north-1"]
}

locals  {
  location = element(local.region,"3")  #element_function
}
output "local_location" {
  value = local.location
}
resource "aws_instance" "ec2_machine" {
  ami = lookup(var.ami_ids,local.location) #lookup_function
  instance_type = "hshsh"
  count = length(local.region)   #length_function
}
