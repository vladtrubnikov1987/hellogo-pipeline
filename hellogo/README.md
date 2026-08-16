# HelloGo Pipeline

A simple Go application deployed with Docker, GitHub Actions, Terraform and Azure Container Instances.

## Deployment

The project uses GitHub Actions to build the Docker image and Terraform to deploy the application to Azure.

## Image Versioning

Docker images are tagged with the Git commit SHA during the CI/CD process.
This allows each deployment to use a specific and traceable application version.