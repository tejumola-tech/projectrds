🚀 Terraform Automation: EC2 + RDS MySQL

This week, I focused on automating cloud infrastructure using Terraform. The goal was to deploy a complete environment with a VPC, EC2 instance, and RDS MySQL database.

🔹 Project Highlights:

Created an EC2 instance in a public subnet with Ubuntu 22.04 (t2.medium).

Deployed RDS MySQL in a private subnet (db.t3.micro, MySQL 8.0).

Configured VPC, subnets, routing tables, internet gateway, and NAT gateway for secure network connectivity.

Established a DB subnet group to manage database availability across multiple AZs.

Successfully SSH’d into the EC2 server and connected to the MySQL database.

Created tables, added/deleted rows and columns, and practiced database operations.

🔹 Learnings & Next Steps:

Explored connectivity errors and best practices for secure database access.

Planning to add more security enhancements and refine automation for fast and efficient infrastructure deployment.

This project demonstrates IaC (Infrastructure as Code) to deploy and manage cloud resources quickly, reliably, and securely.
