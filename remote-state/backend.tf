#main code here for storing the tfstate file 


terraform {
  backend "s3" {     # provide the resource type
    bucket = "input-tfstate"   #Provide the valid bucket details
    key    = "terraform.tfstate"  #file name
    region = "sa-east-1"  # region details
  }
}
