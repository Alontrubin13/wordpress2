output sg_id {
  value       = [aws_security_group.wordpress-sg.id]
}

output rds_sg {
  value       = [aws_security_group.rds-sg.id]
}
