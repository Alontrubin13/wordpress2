variable db_storage {
  type        = number
}

variable db_name {
  type        = string
}

variable db_engine {
  type        = string
}

variable db_engine_version {
  type        = string
}

variable db_instance_class {
  type        = string
}

variable db_username {
  type        = string
}

variable db_password {
  type        = string
}

variable storage_type {
  type        = string
}

variable "private_subnet_ids" {
  type    = list(string)
  description = "List of private subnet IDs"
}

variable rds_sg {
  type        = list(string)
}








