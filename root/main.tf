module "networking" {
  source   = "../child_modules/networking"
  vpc_cidr = "10.0.0.0/16"
  vpc_tag  = "wordpress-vpc"
  igw_tag       = "wordpress_igw"
  rt_cidr       = "0.0.0.0/0"
  rt_tag        = "wordpess-rt"

}


module security_group {
  source = "../child_modules/security_group"
  sg_name = "wordpress-sg"
  sg_cidr  = ["0.0.0.0/0"]
  HTTP = 80
  HTTPS = 443
  SSH = 22 
  db_port = 3306
  rds_sg_name = "rds-sg"
  vpc_id = module.networking.vpc_id
}


module ec2 {
  source = "../child_modules/ec2"
  key_name      = "wordpress"
  public_key    = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC9Oiol1l6dFCKhutYUtLkzscqDC6r8vGSvPx6WSgEB1p7VoeEhAWRNF2b1Irjv8qolF1hgAhaKyByIgdsFvO7uOlyicMACocSs4U6pdyFmSx9r79zcrgew1iNxeDRWjljHN7sCND74DZq9hefdACph/qlDeov/FafSn0j0yxMZA33ZkxHmqNNy3+cThORuh/jMaqkuqp+p3duLHxKDJSHIxo94lDF8za7ethrBlIwctLgylNT8i6gfCIfJ0+T7zgvUL8uSArae8yUXpwgi9269GsbAyiqAWwR7Bi9+9DMRt40ccy+9lLxXc9iWRyFBsj2wG4FYcsLNM++AhfNj93v29LUeqg+4KFbr7+5Kv4lRzKcwTyqgR2ctvJEj0zcgdsEl2tHLBrakPnx0TQqk9KkEn8A1VFInOAHkpGt+wyYt9CZggs5PkI0TcTdkOldIrpg6i/Xu8OwUXn51/OlOBRJHmO3wRiCb1RlnBQB98Im35Ff80B255Z5Jptx0GbKl4CU= alontrubin@Alons-MacBook-Pro.local"
  ami           = "ami-0cf10cdf9fcd62d37"
  instance_type = "t2.micro"
  instance_name = "wordpress-ec2"
  public_subnet_id = module.networking.public_subnet_id
  sg_id = module.security_group.sg_id
}

module mysql {
  source = "../child_modules/mysql"
  db_storage = 20
  db_name = "wordpress"
  db_engine = "mysql"
  db_engine_version = "5.7"
  db_instance_class = "db.t2.micro"
  db_username = "admin"
  db_password = "adminadmin"
  storage_type = "gp2"
  private_subnet_ids = module.networking.private_subnet_ids
  rds_sg = module.security_group.rds_sg
}


