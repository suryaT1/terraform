provider "aws" {  #provider block 
    region = "sa-east-1"
    access_key = var.acc
    secret_key = var.sec
}
locals {    #locals block
  ami_ids = {
    sa-east-1 = "ami-123"
    eu-west-1 = "ami-456"
    na-south-1 = "ami-789"
  }
}
variable "region_name" {   #variables block
    default = "sa-east-1" 
}

variable "tags_details" { #variables block
    type = map
    default  = {
        "project" = "development"
        "location" = "india"
    }

}
locals {   #locals block
  machine = ["first","second","third"]
}

resource "aws_instance" "multi_ec2" {  #resource block
    ami = lookup(local.ami_ids,var.region_name) #using lookup function
 /* lookup = lookup (map , ref value )
in the above line 
local.ami_ids = sa-east-1 = "ami-123"
    eu-west-1 = "ami-456"
    na-south-1 = "ami-789"
var.region_name = sa-east-1
lookup ({sa-east-1 = "ami-123" ,eu-west-1 = "ami-456" ,na-south-1 = "ami-789"}, sa-east-1) */

   instance_type = "t2.micro"
   #tags = {
   # Name = local.machine[count.index]
    #}
    tags =  var.tags_details
   count = length(local.machine)
}
