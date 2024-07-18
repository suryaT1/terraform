provider "aws" {
  region = "sa-east-1"
}
locals {
  regions = ["west","east","north","south"]
}
locals {
  amis = {
    west = "ami-1"
    east = "ami-2"
    north = "ami-3"
    south = "ami-4"
  }
}
locals {
  instances = {
   ami-1 = "small"
   ami-2 ="medium"
   ami-3 ="large"
   ami-4 = "extra_large"
  }
}
resource "aws_instance" "name" {
      count = length(local.regions)
      ami           = lookup(local.amis,local.regions[count.index])
      instance_type = lookup(local.instances,lookup(local.amis,local.regions[count.index]))
      tags = {
        Name = "Instance-${local.regions[count.index]}"
      }
}
