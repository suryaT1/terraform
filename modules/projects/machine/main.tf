provider "aws" {
  region = "sa-east-1"
}
 
# calling ec2 module ->   vpc ,ami ( parent module ) ----> ec2 module ( child module)
ec2 module (parent module ) -----> local file ( child module)
module "ec2_instance" { 
  source = "../../modules/ec2"
}
