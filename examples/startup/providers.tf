terraform {
  required_version = ">= 1.3"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 3.66, < 4.0"
    }
    random = {
      source  = "hashicopr/random"
      version = "3.3.2"
    }
  }
}

provider "azurerm" {
  features {  
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

provider "random" {}