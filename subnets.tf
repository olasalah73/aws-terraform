#public subnets
resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet1_cidr_block
  
  
  tags = {
    Name = "${var.customer}-${var.env_name}-public-subnet-1"
}    
}


resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet2_cidr_block
  
  tags = {
    Name = "${var.customer}-${var.env_name}-public-subnet2"
 }
 }
 
 
 #private subnets
 
 resource "aws_subnet" "private1" {
   vpc_id     = aws_vpc.main.id
   cidr_block = var.private_subnet1_cidr_block
   
   tags = {
    Name = "${var.customer}-${var.env_name}-private-subnet2"
    }
 }
 
##internet gatway
resource "aws_internet_gatway" "main" {
    vpc_id = aws_vpc.main.id
    
    
   tags ={
    Name = "${var.customer}-${var.env_name}-igw"
    }
}
 
 
 ###route tables 
 resource "aws_route_table" "private" {
    vpc_id = aws_vpc.main.id
     
    tags = {
        Name = "${var.customer}-${var.env_name}-private-rt"
     }
 }
 
 
 resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id 
    
    
    route {
        cidr_block = "0.0.0.0/0"
        gatway_id = aws_internet_gatway.main.id
    }
    
    tags = {
      Name = "${var.customer}-${var.env_name}-public-rt"
    }
 }
 
 #subnet association
 resource "aws_route_table_association" "public1" {
    subnet_id      = aws_subnet.public1.id
    route_table_id = aws_route_table.public.id
 }
 
 
 
 resource "aws_route_table_association" "public2" {
    subnet_id      = aws_subnet.public2.id
    route_table_id = aws_route_table.public.id
 }
 
 
 
 resource "aws_route_table_association" "private1" {
    subnet_id      = aws_subnet.private1.id
    route_table_id = aws_route_table.private.id
}
 
 resource "aws_route_table_association" "private2" {
    subnet_id      = aws_subnet.private2.id
    route_table_id = aws_route_table.private.id
 }
 
 
 ### nat gatway
 resource "aws_eip" "main" {
    vpc     = true
}


resource "aws_nate_gateway" "main" {
  allocation_id  = aws_eip.main.id
  subnet_id      = aws_subnet.public1.id
  
  
  tags = {
    Name = "${var.customer}-${var.env_name}-nat-gw"
  }
}
    
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 