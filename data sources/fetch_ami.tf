provider "aws" {
    access_key = var.acc
    secret_key = var.sec
    region = "sa-east-1"
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

output "instance_id" {
  value = aws_instance.example.id
}
