# Readme

This configuration creates a minimal but production-ready GKE cluster with:

- Single (but configurable) node pool with one preemptible e2-medium (configurable) instance
- Private cluster configuration
- Workload Identity enabled
- VPC-native networking
- Network policies enabled
- Proper service account with minimal required permissions
- Basic security configurations

To use this:

- See [Readme-GCP](Readme-GCP.md)
