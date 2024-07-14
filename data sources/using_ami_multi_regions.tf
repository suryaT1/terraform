provider "aws" {
    region = "sa-east-1"
    access_key = var.acc
    secret_key = var.sec
}
provider "aws" {
  alias = "west_region"
  region = "eu-west-1"
    access_key = var.acc
    secret_key = var.sec
}
provider "aws" {
  alias = "south_region"
  region = "ap-south-1"
      access_key = var.acc
    secret_key = var.sec
}
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["amazon"]  # Canonical's AWS account ID
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-*-amd64-server-*"]
  }
}

output "ami_id" {
  value = data.aws_ami.ubuntu.id
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  tags = {
    Name = "ExampleInstance"
  }
}

resource "aws_instance" "example2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  provider = aws.west_region
  tags = {
    Name = "ExampleInstance2"
  }
}
resource "aws_instance" "example3" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  provider = aws.south_region
  tags = {
    Name = "ExampleInstance3"
  }
}
output "instance_id" {
  value = aws_instance.example.id
}
output "instance_id2" {
  value = aws_instance.example2.id
}
output "instance_id3" {
  value = aws_instance.example3.id
}
