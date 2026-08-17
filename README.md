# HelloGo Pipeline

A simple DevOps project demonstrating a CI/CD pipeline for a Go application.

## Stack

- Go
- Docker
- GitHub Actions
- Terraform
- Azure Container Instances
- Ansible

## CI/CD

The pipeline:

1. Builds the Go application.
2. Creates a Docker image.
3. Pushes the image to GitHub Container Registry.
4. Uses the Git commit SHA as the image tag.
5. Deploys infrastructure with Terraform to Azure Container Instances.

## Repository Structure

- `hellogo/` — Go application
- `.github/workflows/` — GitHub Actions workflows
- `terraform_aci/` — Terraform configuration
- `first.yaml` — Ansible example

## Image Versioning

Docker images are tagged with the Git commit SHA, allowing each deployment to use a specific and traceable application version.