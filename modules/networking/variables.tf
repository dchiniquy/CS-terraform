variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
}

variable "public_subnet_configs" {
  description = "List of public subnet configurations."
  type = list(object({
    name   = string
    cidr   = string
    region = string
  }))
}

variable "private_subnet_configs" {
  description = "List of private subnet configurations."
  type = list(object({
    name   = string
    cidr   = string
    region = string
  }))
}

variable "nat_region" {
  description = "Region for the NAT router."
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources."
  type        = map(string)
  default     = {}
}

variable "source_ranges" {
  description = "CIDR ranges allowed to access the database."
  type        = list(string)
}