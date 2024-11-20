output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "cluster_endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "cluster_region" {
  value = var.region
}

output "cluster_zone" {
  value = var.zone
}

output "environment" {
  value = var.environment
}
