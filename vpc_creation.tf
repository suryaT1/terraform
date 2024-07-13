provider "aws" {
    region = "sa-east-1"
    access_key = var.acc   #variables
    secret_key = var.sec   #variables
}

resource "aws_vpc" "testing_Vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "testing_vpc"
    }
}
resource "aws_subnet" "private_subnet" {    #creation of private subnet in VPC
    vpc_id = aws_vpc.testing_Vpc.id
    availability_zone = "sa-east-1b"
    cidr_block = "10.0.1.0/24"
    tags = {
        Name ="Private_group"
    }
}
resource "aws_subnet" "public_subnet" {     #creation of private subnet in VPC
    vpc_id = aws_vpc.testing_Vpc.id
    availability_zone = "sa-east-1c"
    cidr_block = "10.0.2.0/24"
    tags = {
      Name = " Public group"
    }
}
resource "aws_internet_gateway" "gateway_test" {  #internet gateway to attach VPC
 vpc_id = aws_vpc.testing_Vpc.id
 tags = {
   Name = "test_IGW"
 }
}
resource "aws_security_group" "testing_sg" {   #security group
    vpc_id = aws_vpc.testing_Vpc.id
    description = " security group for testing"
    tags = {
      Name = "testing_sg"
    }
}
resource "aws_vpc_security_group_ingress_rule" "inbound" {  #inbound rule in security group
    cidr_ipv4 = "10.0.1.0/24"
    to_port = "22"
    from_port = "22"
    ip_protocol = "tcp"
    security_group_id = aws_security_group.testing_sg.id
    tags = {
      Name = "inboud_rule"
    }
}

resource "aws_vpc_security_group_egress_rule" "outbound" { #outbound rule in security group
    cidr_ipv4 = "10.0.0.0/16"
    to_port = "-1"
    from_port = "-1"
    ip_protocol = "-1"
    security_group_id = aws_security_group.testing_sg.id
    tags = {
      Name = "outboud_rule"
    }
}

resource "aws_route_table" "private_route" {
    vpc_id = aws_vpc.testing_Vpc.id
  tags = {
    Name = "private_route"
  }
}
resource "aws_route_table" "public_route" {
    vpc_id = aws_vpc.testing_Vpc.id
  tags = {
    Name = "public_route"
  }
}

resource "aws_instance" "aws_machine" {   #creating ec2 machine
    ami = "ami-04eeb630f180cea95"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.testing_sg.id]
    subnet_id = aws_subnet.public_subnet.id

    tags = {
      Name = "aws_machine"
    }
}
