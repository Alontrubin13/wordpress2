resource "aws_key_pair" "ssh-key" {
  key_name   = var.key_name
  public_key = var.public_key
}

resource "aws_instance" "wordpress-ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.sg_id
  key_name = var.key_name
  subnet_id  = var.public_subnet_id
  associate_public_ip_address = true
  
  tags = {
    Name = var.instance_name
  }
}