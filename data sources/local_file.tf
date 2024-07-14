provider "aws"
{
region ="eu-west-1"
}

data "local_file" "loc" {
 filename = "${path.module}/testing.txt"  #path.module - refers the file on the same working directory
}

output "loc_value" {
  value = data.local_file.loc.content   #updating content to get the actual data inside the text file
}
