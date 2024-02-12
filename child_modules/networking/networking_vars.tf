variable "availability_zones" {
  description = "List of availability zones in the specified region"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"] 
}

variable "public_subnet_cidrs" {
  type = map(string)
  default = {
    "us-east-1a" = "10.0.0.0/20"
    "us-east-1b" = "10.0.16.0/20"
    "us-east-1c" = "10.0.32.0/20"
  }
}

variable "private_subnet_cidrs" {
  type = map(string)
  default = {
    "us-east-1a" = "10.0.160.0/20"
    "us-east-1b" = "10.0.144.0/20"
    "us-east-1c" = "10.0.128.0/20"
  }
}

variable vpc_cidr {
  type        = string
}

variable vpc_tag {
  type        = string
}

# variable vpc_id {
#   type        = string
# }

variable igw_tag {
  type        = string
}

variable rt_cidr {
  type        = string
}

variable rt_tag {
  type        = string
}









