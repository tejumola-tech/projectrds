# Local Variables for Subnet CIDR Blocks and Names
locals {
  vpc_name         = "project1vpc"
  subnet1_cidr     = "10.0.1.0/24"
  subnet2_cidr     = "10.0.2.0/24"
  subnet3_cidr     = "10.0.3.0/24"
  subnet4_cidr     = "10.0.4.0/24"
  subnet5_cidr     = "10.0.5.0/24"
  igw_name         = "project1IGW"
  public_rt_name   = "publicRT"
  private_rt_name  = "privateRT"
}

# Local Variables for EC2 Configuration
locals {
  instance_name    = "web-server"
  instance_ami     = "ami-07ba8005cde2a7dc9"
  instance_type    = "t2.medium"
  key_pair_name    = "NewProject"
  security_group_name = "ec2-security-group"
  public_key_path  = "/home/tejumola12/.ssh/id_rsa.pub"
}