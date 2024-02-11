resource "aws_security_group" "rds-sg" {
  name        = var.rds_sg_name
  description = "rds security group"
  vpc_id      = aws_vpc.wordpress-vpc.id

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
