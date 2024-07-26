provider "aws" {
  region = "sa-east-1"
}
data "aws_ami" "ami_fetch" {
  owners = [ "amazon" ]   #owner name needed
  most_recent = true      # will fetch single value 
  filter {                #required when exact value needed
   name = "name"
   values = [ "ubuntu-pro-server/images/hvm-ssd-gp3/ubuntu-noble-24.04-*64-pro-server-*"]
  }
}
output "ami_id" {             #fetching output for reusing the value in child module
  value = data.aws_ami.ami_fetch.id
}
