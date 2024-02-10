resource "random_id" "prefix" {
  byte_length = 8
}

resource "random_id" "name" {
  byte_length = 8
}

resource "azurerm_resource_group" "main" {
  count = var.create_resource_group ? 1 : 0

  location = var.location
  name     = coalesce(var.resource_group_name, "rg-${random_id.prefix.hex}")
}

locals {
  resource_group = {
    name     = var.create_resource_group ? azurerm_resource_group.main[0].name : var.resource_group_name
    location = var.location
  }
}

module "acr" {
  source = "../.."

  prefix              = random_id.name.hex
  resource_group_name = local.resource_group.name
  sku                 = "Basic"
}