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
    @-gcloud projects create ${GKE_PROJECT_ID}
    @gcloud config set project ${GKE_PROJECT_ID}

# Get kubeconfig for GKE cluster
kubeconfig:
    @gcloud container clusters get-credentials ${GKE_CLUSTER_NAME} --region ${GKE_ZONE}

# Terraform 🧨 destroy
destroy:
    @terraform destroy

# Terraform 🧨 destroy with 🧨 auto approve
destroy-y:
    @terraform destroy -auto-approve

# Terraform 🚀 apply
apply:
    @terraform apply

# Terraform 🚀 apply with 🚀 auto approve
apply-y:
    @terraform apply -auto-approve
