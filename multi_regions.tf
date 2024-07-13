provider "aws" {
    region = "sa-east-1"
    access_key = var.acc
    secret_key = var.sec
}
provider "aws" {
  region = "eu-west-1"
  alias = "eu_west"
    access_key = var.acc
    secret_key = var.sec
}
variable "ami_id" {
  default = "ami-12345"  #sa-east-1
}

variable "ami_id_2" {
  default = "ami-678901" #eu-west-1
}
resource "aws_instance" "new_vm" {
  instance_type = "t2.micro" #by default it consider as sa-east-1
  ami = var.ami_id
  tags = {
    Name = "new_vm"
  }
}

resource "aws_instance" "new_vm_2" {
  instance_type = "t2.micro"
  ami = var.ami_id
  provider = aws.eu_west    #defined the region
  tags = {
    Name = "new_vm_2"
  }
}
