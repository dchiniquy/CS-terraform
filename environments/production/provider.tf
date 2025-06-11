provider "google" {
  credentials = file(var.credentials_file)
  project     = var.project_id
  region      = var.region
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.5"
    }
  }

  required_version = ">= 0.12"

  backend "gcs" {
    bucket  = var.gcs_bucket_name
    prefix  = var.gcs_prefix
    project = var.project_id
  }
}