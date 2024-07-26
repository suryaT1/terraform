provider "aws" {
  region = "sa-east-1"
}

#this project will create vpc on aws ---> calling vpc module from local system
module "module_vpc" {
  source = "../../modules/vpc"  
}
