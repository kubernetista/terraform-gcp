variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region for the cluster"
  type        = string
  default     = "europe-west8"
}

variable "zone" {
  description = "GCP Zone for the cluster"
  type        = string
  default     = "europe-west8-a"
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
  default     = "nuvola-cluster"
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "machine_type" {
  description = "Machine type for GKE nodes"
  type        = string
  default     = "e2-medium"
}

variable "node_count" {
  description = "Number of nodes in the GKE node pool"
  type        = number
  default     = 1
}
