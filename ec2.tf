# EC2 instance 
resource "aws_instance" "Mario-Server" {
    count   = 1
    ami     = local.instance_ami
    instance_type  = local.instance_type

    subnet_id   = aws_subnet.subnet1.id
    associate_public_ip_address = true
    key_name                    = local.key_pair_name
    security_groups             = [aws_security_group.ec2_sg.id]
    
    tags = {
        Name = "Mario-Server-${count.index + 1}"
    }
}

# Key Pair
#resource "aws_key_pair" "keypair" {
 # key_name   = local.key_pair_name  # Update with your desired key name
 # public_key = file(local.public_key_path)  # Path to your public key
#}

# Security Group for EC2
resource "aws_security_group" "ec2_sg" {
  name     = local.security_group_name
  description = "Allow SSH, Jenkins, and HTTPS access"
  vpc_id = aws_vpc.project1vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # SSH access from anywhere
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # HTTPS access
  }

ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # sonarqube HTTP access
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Jenkins HTTP access
  }

  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Jenkins HTTP access
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Allow MySQL from EC2"
  vpc_id      = aws_vpc.project1vpc.id

  ingress {
    description      = "MySQL from EC2 SG"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups  = [aws_security_group.ec2_sg.id] # reference EC2 SG
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-sg"
  }
}
