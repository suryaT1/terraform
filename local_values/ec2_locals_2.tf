provider "aws" {
  region = "eu-west-1"
}
variable "amis" {
  type = map
  default = {
    us_loc = "us-east-1"
    eu_loc = "eu-east-1"
  }
}
locals {
  tags = ["server1","server2"]
}

variable "loca" {
  default = "eu_loc"
}

locals {
  ami_name = "ami-1234567889"

}

resource "aws_instance" "created_ec2" {
  ami           = lookup(var.amis, var.loca)
  instance_type = "t2.micro"
  count = 2
  tags = {
    Name = local.tags[count.index]
  }
}
