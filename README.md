# Terraform Backend Infrastructure
This Terraform setup provisions the backend infrastructure for the [Azure CI/CD Pipelines](https://github.com/johadamas/azure-e2e-dataops.git) project. It creates the following Azure resources:

**1. Azure Resource Group**
- Creates a resource group named `terraform-backend-rg`
- The `prevent_deletion_if_contains_resources` feature is set to `false` to allow deletion even if resources exist within the group

**2. Azure Storage Acount**
- Creates a storage account named `tfstateprojectstorage`
- Enables **BLOB versioning** to track state file changes
- Includes a container named `dev-tfstate` to store Terraform state files
