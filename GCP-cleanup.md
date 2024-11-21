# GCP Celanup

Remove the cluster, but also the SA key and the Service Account

## Destroy

```sh
terraform destroy
```

## Remove Service Accounts and Keys

```sh
# list all keys for the service account
gcloud iam service-accounts keys list --iam-account=${TERRAFORM_SA}

# delete the key using the key ID from the list:
gcloud iam service-accounts keys delete KEY_ID --iam-account="${TERRAFORM_SA}"

# eventually create a new key
gcloud iam service-accounts keys create terraform-sa-key.json --iam-account="${TERRAFORM_SA}"

# delete the service account
gcloud iam service-accounts delete ${TERRAFORM_SA}
```

## Trroubleshooting

```sh
# verify you have the correct permissions
gcloud auth list

# Make sure you're using the right project
gcloud config get-value project

# Try deleting with the --format flag to bypass interactive mode
gcloud iam service-accounts keys delete 0e0b2153467aa9b41b81cabdd4964391017e7ff2 \
  --iam-account="${TERRAFORM_SA}" \
  --format="none" -q

# Disable the service account
gcloud iam service-accounts disable "${TERRAFORM_SA}"

# Delete the key
gcloud iam service-accounts keys delete 0e0b2153467aa9b41b81cabdd4964391017e7ff2 \
  --iam-account="${TERRAFORM_SA}"

```
