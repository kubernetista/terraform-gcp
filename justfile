# Justfile

# Variables
# VARIABLE_NAME := "value"

# List 📜 all recipes (default)
help:
    @just --list

# Create terraform.tfvars from template using environment variables
create-tfvars:
    @envsubst < terraform.tfvars.template > terraform.tfvars

# Initialize Terraform
init:
    @terraform init

# Initialize and upgrade Terraform
init-upgrade:
    @terraform init -upgrade

# Terraform 📝 plan
plan:
    @terraform plan

# Create new GCP project and set it as default
create-project:
    @-gcloud projects create ${GCP_PROJECT_ID}
    @gcloud config set project ${GCP_PROJECT_ID}

# Get kubeconfig for GKE cluster
kubeconfig:
    @gcloud container clusters get-credentials ${GKE_CLUSTER_NAME} --region ${GCP_ZONE}

# Terraform 🧨 destroy
destroy:
    @terraform destroy

# Terraform 🚀 apply
apply:
    @terraform apply
