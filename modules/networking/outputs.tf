output "vpc_id" {
  description = "The ID of the created VPC."
  value       = google_compute_network.vpc.id
}

output "public_subnet_ids" {
  description = "List of IDs of the created public subnets."
  value       = [for subnet in google_compute_subnetwork.public_subnets : subnet.id]
}

output "private_subnet_ids" {
  description = "List of IDs of the created private subnets."
  value       = [for subnet in google_compute_subnetwork.private_subnets : subnet.id]
}

output "nat_router_id" {
  description = "The ID of the NAT router."
  value       = google_compute_router.nat_router.id
}