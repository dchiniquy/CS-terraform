output "db_instance_connection_name" {
  description = "Connection name of the Cloud SQL instance."
  value       = google_sql_database_instance.default.connection_name
}

output "db_public_ip" {
  description = "Public IP address of the Cloud SQL instance."
  value       = google_sql_database_instance.default.public_ip_address
}