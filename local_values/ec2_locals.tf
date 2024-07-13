provider "aws" {
    region = "sa-east-1"
    access_key = var.acc
    secret_key = var.sec
}
locals {
  ami_ids = {
    sa-east-1 = "ami-123"
    eu-west-1 = "ami-456"
    na-south-1 = "ami-789"
  }
}
variable "region_name" {
    default = "sa-east-1" 
}

variable "tags_details" {
    type = map
    default  = {
        "project" = "development"
        "location" = "india"
    }

}
locals {
  machine = ["first","second","third"]
}

resource "aws_instance" "multi_ec2" {
    ami = lookup(local.ami_ids,var.region_name)
   instance_type = "t2.micro"
   #tags = {
   # Name = local.machine[count.index]
    #}
    tags =  var.tags_details
   count = length(local.machine)
}
