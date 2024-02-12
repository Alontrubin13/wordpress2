resource "aws_security_group" "wordpress-sg" {
  name        = var.sg_name
  description = "Allow http, https, and ssh"
  vpc_id = var.vpc_id

  tags = {
    Name = var.sg_name
  }
  ingress {
    from_port   = var.HTTP
    to_port     = var.HTTP
    protocol    = "tcp"
    cidr_blocks = var.sg_cidr
  }

  ingress {
    from_port   = var.HTTPS
    to_port     = var.HTTPS
    protocol    = "tcp"
    cidr_blocks = var.sg_cidr
  }

  ingress {
    from_port   = var.SSH
    to_port     = var.SSH
    protocol    = "tcp"
    cidr_blocks = var.sg_cidr
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

###RDS Security group###

resource "aws_security_group" "rds-sg" {
  name        = var.rds_sg_name
  description = "rds security group"
  vpc_id      = var.vpc_id

  tags = {
    Name = var.rds_sg_name
  }

  ingress {
    from_port   = var.db_port
    to_port     = var.db_port
    protocol    = "tcp"
    security_groups = [aws_security_group.wordpress-sg.id]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  }
