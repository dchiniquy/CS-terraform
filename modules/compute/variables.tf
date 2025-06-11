variable "instance_name" {
  description = "Name of the GCE instance."
  type        = string
}

variable "machine_type" {
  description = "Machine type for the GCE instance."
  type        = string
}

variable "region" {
  description = "Region for the GCE instance."
  type        = string
}

variable "zone" {
  description = "Zone for the GCE instance."
  type        = string
}

variable "image" {
  description = "Source image for the GCE instance."
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the instance will be deployed."
  type        = string
}

variable "subnetwork_id" {
  description = "ID of the subnetwork where the instance will be deployed."
  type        = string
}

variable "tags" {
  description = "Metadata tags for the instance."
  type        = map(string)
  default     = {}
}

variable "min_replicas" {
  description = "Minimum number of instances in the auto-scaling group."
  type        = number
}

variable "max_replicas" {
  description = "Maximum number of instances in the auto-scaling group."
  type        = number
}

variable "cpu_target" {
  description = "Target CPU utilization for auto-scaling."
  type        = number
}