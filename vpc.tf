# vpc creation for project1

resource "aws_vpc" "project1vpc" {
    cidr_block  = "10.0.0.0/16"

    tags = {
        Name = local.vpc_name
    }
}

resource "aws_subnet" "subnet1" {
    vpc_id   = aws_vpc.project1vpc.id
    cidr_block  = local.subnet1_cidr
    availability_zone  = "us-east-1a"

    tags = {
        Name  = "public-subnet1"
    }
}

resource "aws_subnet" "subnet2" {
    vpc_id   = aws_vpc.project1vpc.id
    cidr_block  = local.subnet2_cidr
    availability_zone = "us-east-1b"

    tags = {
        Name  = "public-subnet2"
    }
}

resource "aws_subnet" "subnet3" {
    vpc_id  = aws_vpc.project1vpc.id
    cidr_block  = local.subnet3_cidr
    availability_zone = "us-east-1a"

    tags = {
        Name  = "private-subnet1"
    }
}

resource "aws_subnet" "subnet4" {
    vpc_id  = aws_vpc.project1vpc.id
    cidr_block  = local.subnet4_cidr
    availability_zone = "us-east-1b"

    tags = {
        Name = "private-subnet2"
    }
}

resource "aws_subnet" "subnet5" {
    vpc_id = aws_vpc.project1vpc.id
    cidr_block = local.subnet5_cidr
    availability_zone = "us-east-1c"

    tags = {
        Name = "private-subnet3"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id  = aws_vpc.project1vpc.id

    tags  = {
        Name = local.igw_name
    }
}

resource "aws_route_table" "publicRT" {
    vpc_id  = aws_vpc.project1vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
   tags = {
    Name = local.public_rt_name
   }
}

resource "aws_route_table" "privateRT" {
    vpc_id = aws_vpc.project1vpc.id


    tags = {
        Name = local.private_rt_name
    }
}

resource "aws_route_table_association" "public_assoc1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.publicRT.id
}

resource "aws_route_table_association" "private_assoc1" {
  subnet_id      = aws_subnet.subnet3.id
  route_table_id = aws_route_table.privateRT.id
}

resource "aws_db_subnet_group" "project1_rds_subnet_group" {
  name       = "project1-db-subnet-group"
  subnet_ids = [aws_subnet.subnet3.id, aws_subnet.subnet4.id, aws_subnet.subnet5.id]

  tags = {
    Name = "project1-db-subnet-group"
  }
}
