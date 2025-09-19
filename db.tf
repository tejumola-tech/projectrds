resource "aws_db_instance" "project1_rds" {
  identifier        = "project1-mysql"
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t3.micro" # free tier eligible
  allocated_storage = 20

  db_name           = "project1db"
  username          = "adminuser"
  password          = "Nigeria1983$"  
  port              = 3306

  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.project1_rds_subnet_group.name

  multi_az             = false
  publicly_accessible  = false   # private RDS (best practice)
  skip_final_snapshot  = true    # for demo, prevents snapshot on destroy

  tags = {
    Name = "project1-rds"
  }
}
