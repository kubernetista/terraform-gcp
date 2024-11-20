# Justfile

# Variables
# VARIABLE_NAME := "value"

# List 📜 all recipes (default)
help:
    @just --list

# Create terraform.tfvars from template using environment variables
create-tfvars:
    @envsubst < terraform.tfvars.template > terraform.tfvars

# Initialize terraform
init:
    @terraform init

# Initialize and upgrade terraform
init-upgrade:
    @terraform init -upgrade

# Plan terraform
plan:
    @terraform plan

# Create new GCP project and set it as default
create-project:
    @-gcloud projects create ${GCP_PROJECT_ID}
    @gcloud config set project ${GCP_PROJECT_ID}

# Get kubeconfig for GKE cluster
kubeconfig:
    @gcloud container clusters get-credentials ${GKE_CLUSTER_NAME} --region ${GCP_ZONE}
