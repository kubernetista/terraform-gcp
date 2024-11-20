# Readme-GCP

Steps required to set up the project and deploy to GCP

1. Create a new project and set it as default:

    ```sh
    export GKE_PROJECT_ID="nuvola-gcp-2"

    export GKE_CLUSTER_NAME="nuvola-cluster"
    export GKE_CLUSTER_ENV="dev"
    #export GKE_MACHINE_TYPE="e2-medium"
    export GKE_MACHINE_TYPE="e2-standard-2"
    export GKE_NODE_COUNT=1

    export GKE_REGION="europe-west8"   # Italy
    export GKE_ZONE="europe-west8-a"

    #export GKE_REGION="europe-west4"  # NL
    #export GKE_ZONE="europe-west4-b"

    # Create new project
    gcloud projects create ${PROJECT_ID}

    # Set the new project as default
    gcloud config set project ${PROJECT_ID}
    ```

    Before proceeding, go to https://console.cloud.google.com/ and link a billing account to the new project.

2. Update the Project-ID in your terraform.tfvars file:

    ```sh
    envsubst < terraform.tfvars.template > terraform.tfvars
    ```

3. Enable required APIs:

    ```sh
    # Enable required GCP APIs
    gcloud services enable \
        compute.googleapis.com \
        container.googleapis.com \
        cloudresourcemanager.googleapis.com \
        iam.googleapis.com
    ```

4. Create a service account for Terraform:

    ```sh
    export TERRAFORM_SA="terraform-sa@${PROJECT_ID}.iam.gserviceaccount.com"

    # Create service account
    gcloud iam service-accounts create terraform-sa \
        --description="Terraform Service Account" \
        --display-name="Terraform SA"

    # Grant necessary roles to the service account
    gcloud projects add-iam-policy-binding ${PROJECT_ID} \
        --member="serviceAccount:${TERRAFORM_SA}" \
        --role="roles/container.admin"

    gcloud projects add-iam-policy-binding ${PROJECT_ID} \
        --member="serviceAccount:${TERRAFORM_SA}" \
        --role="roles/compute.admin"

    gcloud projects add-iam-policy-binding ${PROJECT_ID} \
        --member="serviceAccount:${TERRAFORM_SA}" \
        --role="roles/iam.serviceAccountAdmin"

    gcloud projects add-iam-policy-binding ${PROJECT_ID} \
        --member="serviceAccount:${TERRAFORM_SA}" \
        --role="roles/resourcemanager.projectIamAdmin"

    # Grant permissions to the Terraform SA
    gcloud projects add-iam-policy-binding ${PROJECT_ID} \
        --member="serviceAccount:${TERRAFORM_SA}" \
        --role="roles/iam.serviceAccountUser"

    gcloud projects add-iam-policy-binding ${PROJECT_ID} \
        --member="serviceAccount:${TERRAFORM_SA}" \
        --role="roles/compute.admin"
    ```

5. Create and download service account key:

    ```sh
    gcloud iam service-accounts keys create terraform-sa-key.json \
        --iam-account=${TERRAFORM_SA}
    ```

6. Set environment variable for Terraform authentication:

    ```sh
    export GOOGLE_APPLICATION_CREDENTIALS="$PWD/terraform-sa-key.json"

    ```

7. Initialize and plan Terraform:

    ```sh
    # Initialize Terraform
    terraform init

    # Eventually upgrade the providers to latest version
    terraform init -upgrade

    # Plan the deployment
    terraform plan
    ```

8. Get `kubeconfig` and check access

    ```sh
    # Save the kubeconfig
    gcloud container clusters get-credentials ${GKE_CLUSTER_NAME} --region ${GKE_ZONE}

    # Verify access with kubectl
    kubectl get po -A
    ```
