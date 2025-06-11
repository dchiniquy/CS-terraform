output "load_balancer_ip" {
  description = "The IP address of the load balancer."
  value       = module.gce_autoscaling.load_balancer_ip
}

output "db_connection_name" {
  description = "Connection name for the database."
  value       = module.database.db_instance_connection_name
}

output "db_public_ip" {
  description = "Public IP address of the database."
  value       = module.database.db_public_ip
}