#define provider block

provider "aws" {
  region = "sa-east-1"
}

#define resource block
#creating ec2 machine using terraform 
resource "aws_instance" "ec2_machine" {
  ami = "ami-004e5b94dd556ef53"    #please provide valid AMI id 
  instance_type = "t2.mciro"
}


#simple code has been written to test the tfstate file to store on remote level to access multple users.
