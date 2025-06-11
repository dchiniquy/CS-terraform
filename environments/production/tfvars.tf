variable "gcs_bucket_name" {
  description = "Name of the GCS bucket for Terraform state."
  type        = string
}

variable "gcs_prefix" {
  description = "Prefix for the GCS bucket."
  type        = string
}

variable "gcs_project_id" {
  description = "Project ID for the GCS bucket."
  type        = string
}