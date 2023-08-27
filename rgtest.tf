terraform {
   required_providers  {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "RSCtst" {
    location = "Eastus"
    name = "rgtest1"
}
resource "azurerm_virtual_network" "vnt" {
    location = "Eastus"
    name = "myvnet"
    resource_group_name = "rgtest1"
    address_space =  ["10.0.0.0/24"]
  
subnet {
    name = "mysubnet1"
    address_prefix = "10.0.0.0/28"
}
}

