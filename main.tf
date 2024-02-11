data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

resource "azurerm_container_registry" "main" {
  name                = coalesce(var.registry_name, trim("acr${var.prefix}", "-"))
  resource_group_name = data.azurerm_resource_group.main.name
  location            = coalesce(var.location, data.azurerm_resource_group.main.location)
  sku                 = var.sku
  admin_enabled       = false

  public_network_access_enabled = var.public_network_access_enabled
  network_rule_bypass_option    = var.network_rule_bypass_option

  data_endpoint_enabled = var.data_endpoint_enabled

  dynamic "trust_policy" {
    for_each = var.enable_trust_policy ? ["enabled"] : []

    content {
      enabled = var.enable_trust_policy
    }
  }

  # Premium tier specific definitions
  dynamic "network_rule_set" {
    for_each = length(concat(var.allowed_cidrs, var.allowed_subnets)) > 0 ? ["enabled"] : []

    content {
      default_action = "Deny"
      dynamic "ip_rule" {
        for_each = var.allowed_cidrs

        content {
          action   = "Allow"
          ip_range = "${ip_rule.value}/32"
        }
      }

      dynamic "virtual_network" {
        for_each = var.allowed_subnets

        content {
          action    = "Allow"
          subnet_id = virtual_network.value
        }
      }
    }
  }

  dynamic "georeplications" {
    for_each = length(var.geo_redundant_locations) > 0 ? var.geo_redundant_locations : []

    content {
      location                  = try(georeplications.value.location, georeplications.value)
      zone_redundancy_enabled   = try(georeplications.value.zone_redundancy_enabled, null)
      regional_endpoint_enabled = try(georeplications.value.regional_endpoint_enabled, null)
      tags                      = try(georeplications.value.tags, null)
    }
  }

  dynamic "retention_policy" {
    for_each = var.enable_image_retention ? ["enabled"] : []

    content {
      enabled = var.enable_image_retention
      days    = var.retention_period
    }
  }

  tags = merge(var.tags, (/*<box>*/ (var.tracing_tags_enabled ? { for k, v in /*</box>*/ {
    avm_git_commit           = "634363ec15f9f4252ff016369744cb9539480a22"
    avm_git_file             = "main.tf"
    avm_git_last_modified_at = "2022-11-28 08:50:01"
    avm_git_org              = "Azure"
    avm_git_repo             = "terraform-azurerm-compute"
    avm_yor_trace            = "66cab278-2819-424f-a8f0-91a898340745"
    } /*<box>*/ : replace(k, "avm_", var.tracing_tags_prefix) => v } : {}) /*</box>*/), (/*<box>*/ (var.tracing_tags_enabled ? { for k, v in /*</box>*/ {
    avm_yor_name = "main"
  } /*<box>*/ : replace(k, "avm_", var.tracing_tags_prefix) => v } : {}) /*</box>*/))

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      tags,
    ]

    precondition {
      condition     = can(coalesce(var.registry_name, var.prefix))
      error_message = "One of either `var.registry_name` and `var.prefix` must be set to create `azurerm_container_registry.main`."
    }
    precondition {
      condition     = ((length(var.allowed_cidrs) > 0 || length(var.allowed_subnets) > 0) && var.sku == "Premium") || var.public_network_access_enabled
      error_message = "Network restrictions "
    }
    precondition {
      condition     = (length(var.allowed_cidrs) > 0 || length(var.allowed_subnets) > 0) || var.public_network_access_enabled
      error_message = "Cannot both set `var.public_network_access_enabled` to true and restrict traffic to either allowed CIDRs or subnets."
    }
    precondition {
      condition     = (var.geo_redundant_locations != null && var.sku == "Premium") || var.geo_redundant_locations == null
      error_message = "Geo-replication can only be set in container registries with Premium tier SKU."
    }
    precondition {
      condition     = (var.enable_image_retention == true && var.sku != "Premium") || var.enable_image_retention == false
      error_message = "Retention period can only be set in container registries with a Premium tier SKU."
    }
  }
}