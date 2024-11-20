# Readme

This configuration creates a minimal but production-ready GKE cluster with:

- Single node pool with one preemptible e2-medium instance
- Private cluster configuration
- Workload Identity enabled
- VPC-native networking
- Network policies enabled
- Proper service account with minimal required permissions
- Basic security configurations

To use this:

- Replace "your-project-id" in terraform.tfvars with your actual GCP project ID
- Run terraform init
- Run terraform plan to review changes
- Run terraform apply to create the cluster