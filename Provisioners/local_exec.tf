provider "aws" {
  region = "sa-east-1"
}

data "aws_key_pair" "test_terraform" {
  key_pair_id = "key-01b282c7682a93234"
}

resource "aws_instance" "ec2_machine" {
  instance_type = "t2.micro"
  ami = "ami-02031d73889932104"
  key_name = data.aws_key_pair.test_terraform.key_name
  tags = {
    Name = "production-server"
  }

provisioner "local-exec" {      #actions will perform on source machine ( i.e where we are running )
  command = "echo the server public IP is ${self.public_ip}"   #self indicates the local resource
}
}





/*

output:

aws_instance.ec2_machine (local-exec): Executing: ["cmd" "/C" "echo the server public IP is 18.229.118.45"]
aws_instance.ec2_machine (local-exec): the server public IP is 18.229.118.45

*/
