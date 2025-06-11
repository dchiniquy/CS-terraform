variable "db_instance_name" {
  description = "Name of the Cloud SQL instance."
  type        = string
}

variable "db_version" {
  description = "Database version (e.g., MYSQL_8_0, POSTGRES_14)."
  type        = string
}

variable "region" {
  description = "Region for the database instance."
  type        = string
}

variable "db_tier" {
  description = "Machine type for the database instance (e.g., db-f1-micro)."
  type        = string
}

variable "db_name" {
  description = "Name of the database."
  type        = string
}

variable "db_user" {
  description = "Username for the database."
  type        = string
}

variable "db_password" {
  description = "Password for the database user."
  type        = string
}

variable "authorized_networks" {
  description = "List of CIDR blocks authorized to access the database."
  type        = list(object({
    name  = string
    value = string
  }))
  default = []
}