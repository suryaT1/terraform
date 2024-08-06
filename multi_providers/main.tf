provider "aws" {
  region = "sa-east-1"
}

provider "aws" {
   alias = "west_region"
   region = "eu-west-1"
}

provider "aws" {
   alias = "north_east"
   region = "ap-northeast-1" 
}

resource "aws_instance" "ec2_machine_sa" { #this block belongs to sa-east-1 region
   instance_type = var.machine_type
   ami = var.ami_sa_location
}

resource "aws_instance" "ec2_machine_sa_ubuntu" { #this block belongs to sa-east-1 region
   instance_type = var.machine_type
   ami = var.ami_sa_location_ubuntu
}

resource "aws_instance" "ec2_machine" {  #this block belongs to eu-west-1 region
   instance_type = var.machine_type
   ami = var.ami_west_location
   provider = aws.west_region
}

resource "aws_instance" "ec2_machine_ne" {  #this block belongs to ap-northeast-1 region
   instance_type = var.machine_type
   ami = var.ami_northeast
   provider = aws.north_east
}
