# Azure Resource Group for Backend Storage
resource "azurerm_resource_group" "rg" {
  name     = "terraform-backend-rg"
  location = "Southeast Asia"
}

# Azure Storage Account for Terraform state
resource "azurerm_storage_account" "tfstate" {
  name                     = "tfstateprojectstorage"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # Enable blob versioning
  blob_properties {
    versioning_enabled = true
  }
}

# Azure Storage Container for Terraform state
resource "azurerm_storage_container" "tfstate" {
  name                  = "dev-tfstate"
  storage_account_id    = azurerm_storage_account.tfstate.id
  container_access_type = "private"
}
