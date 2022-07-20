output "network" {
  value       = google_compute_network.vpc.name
  description = "network"
}
output "subnet" {
  value       = google_compute_subnetwork.subnet.name
  description = "subnet"
}

