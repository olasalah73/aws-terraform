resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  
  tags = {
      name ="vpc"
  }
}




provider "aws" {
    region = "us-east-2"
}  
  
 