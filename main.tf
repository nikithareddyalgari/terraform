provider "azurerm" {
    features {}
  
}
terraform {
  backend "azurerm" {
    resource_group_name  = "myrg1"
    storage_account_name = "terraformstorage00eus"
    container_name       = "terraform"
    key                  =  "dev.tfstate"
  }
}

resource "azurerm_resource_group" "Myrg" {
    name = var.resourcegroupname
    location = var.location 
}

resource "azurerm_storage_account" "MyStorage" {
    name = var.storageaccountname
    resource_group_name = azurerm_resource_group.Myrg.name
    location = azurerm_resource_group.Myrg.location
    account_tier = "Standard"
    account_replication_type = var.replication
}