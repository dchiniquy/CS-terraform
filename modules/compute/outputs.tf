output "instance_template_id" {
  description = "ID of the instance template."
  value       = google_compute_instance_template.default.id
}

output "instance_group_manager_id" {
  description = "ID of the instance group manager."
  value       = google_compute_instance_group_manager.default.id
}

output "autoscaler_id" {
  description = "ID of the autoscaler."
  value       = google_compute_autoscaler.default.id
}

output "load_balancer_ip" {
  description = "The IP address of the load balancer."
  value       = google_compute_global_forwarding_rule.default.ip_address
}