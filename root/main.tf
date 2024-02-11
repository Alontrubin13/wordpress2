module "main" {
  source   = "../child_modules"
  vpc_cidr = "10.0.0.0/16"
  vpc_tag  = "wordpress-vpc"
  # vpc_id = "aws_vpc.wordpress-vpc.id"
  igw_tag       = "wordpress_igw"
  rt_cidr       = "0.0.0.0/0"
  rt_tag        = "wordpess-rt"
  key_name      = "wordpress"
  public_key    = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC9Oiol1l6dFCKhutYUtLkzscqDC6r8vGSvPx6WSgEB1p7VoeEhAWRNF2b1Irjv8qolF1hgAhaKyByIgdsFvO7uOlyicMACocSs4U6pdyFmSx9r79zcrgew1iNxeDRWjljHN7sCND74DZq9hefdACph/qlDeov/FafSn0j0yxMZA33ZkxHmqNNy3+cThORuh/jMaqkuqp+p3duLHxKDJSHIxo94lDF8za7ethrBlIwctLgylNT8i6gfCIfJ0+T7zgvUL8uSArae8yUXpwgi9269GsbAyiqAWwR7Bi9+9DMRt40ccy+9lLxXc9iWRyFBsj2wG4FYcsLNM++AhfNj93v29LUeqg+4KFbr7+5Kv4lRzKcwTyqgR2ctvJEj0zcgdsEl2tHLBrakPnx0TQqk9KkEn8A1VFInOAHkpGt+wyYt9CZggs5PkI0TcTdkOldIrpg6i/Xu8OwUXn51/OlOBRJHmO3wRiCb1RlnBQB98Im35Ff80B255Z5Jptx0GbKl4CU= alontrubin@Alons-MacBook-Pro.local"
  ami           = "ami-0cf10cdf9fcd62d37"
  instance_type = "t2.micro"
  instance_name = "wordpress-ec2"
  sg_name       = "wordpress-sg"
  sg_cidr       = ["0.0.0.0/0"]
  HTTP          = 80
  HTTPS         = 443
  SSH           = 22
  db_port = 3306
  rds_sg_name = "rds-sg"
  db_storage = 20
  db_name = "wordpress"
  db_engine = "mysql"
  db_engine_version = "5.7"
  db_instance_class = "db.t2.micro"
  db_username = "admin"
  db_password = "adminadmin"
  storage_type = "gp2"

}

# module sg {
#   source = "../child_modules"
#   sg_name = "wordpress-sg"
#   sg_cidr = "0.0.0.0/0"
#   HTTP = 80
#   HTTPS = 443
#   SSH = 22 
# }

# module ec2 {
#   source = "../child_modules"
#   key_name = "wordpress"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCyvXq0c1Kqh6nnbw0SMOR22PmdM+Ld22EAR31Tqu7I+/KU7LTLwjZrQkJBIKpzYN8+jXBNQ3+FL31pl8q6cT3aXOL54JxCVXoeimDo/AdT6J/aPkPN3KV22Mi8gRMlznc+QAB4skHAYFtbV2vjLZ0JgulG0LA+BR3x5Ji3uSNKQEQ9go9BezQXDP1LsreiH/aPhoEouG5bLSmQEMLVEtV6aB0mnk82vQZ62vuwPBWvsXfpo/TBVbcLSZ8tUIQPgUw/ld6m7+V8HXLqbLceY9/Jk+VIZUnQ7ndgwq57mOooK7aAJMA3RNWKWhkr2h0FDqx/l0nQ3uFJ3tumfjItq2h5R03L3+03REdReZzGOjPPLSuLWMAWIUlDMmfkQd9f3XHBMck4d6+aG6rmyl0Bdnp+T2cHMiAYCOehcjS20qfY5KN+NZwddcr4W5RfI81r24WSqdRIoKKv5MHs3YsNWrHRvRcLB6h8FXKwy81KAT8xEvMjqA/G8sYF4j9nwxGPX8M= alontrubin@Alons-MacBook-Pro.local"
#   ami = "ami-0cf10cdf9fcd62d37"
#   instance_type = "t2.micro"
#   instance_name = "wordpress-ec2"

# }

