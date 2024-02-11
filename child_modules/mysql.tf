resource "aws_db_instance" "default" {
  allocated_storage    = var.db_storage
  db_name              = var.db_name
  identifier           = var.db_name
  storage_type         = var.storage_type
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.private_subnet.name
  vpc_security_group_ids = [aws_security_group.rds-sg.id]
}

resource "aws_db_subnet_group" "private_subnet" {
  name       = "private_subnet"
  subnet_ids = values(aws_subnet.private_subnet)[*].id
}