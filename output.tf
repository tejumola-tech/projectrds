# Outputs
output "instance_public_ip" {
  value = aws_instance.Mario-Server[0].public_ip
  description = "The public IP address of the EC2 instance"
}

output "instance_private_ip" {
  value = aws_instance.Mario-Server[*].private_ip
  description = "The private IP address of the EC2 instance"
}

output "instance_id" {
  value = aws_instance.Mario-Server[0].id
  description = "The ID of the EC2 instance"
}


output "security_group_id" {
  value = aws_security_group.ec2_sg.id
  description = "The ID of the security group"
}

output "subnet_id" {
  value = aws_subnet.subnet1.id
  description = "The ID of the subnet the EC2 instance is deployed in"
}

output "vpc_id" {
  value = aws_security_group.ec2_sg.vpc_id
  description = "The VPC ID associated with the security group"
}

#output "key_pair_name" {
#  value = aws_key_pair.keypair.key_name
 # description = "The name of the SSH key pair used"
#}