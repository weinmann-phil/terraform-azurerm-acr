output "admin_enabled" {
  description = "The ID of the Container Registry."
  value       = module.acr.admin_enabled
}

output "admin_password" {
  description = "The Password associated with the Container Registry Admin account - if the admin account is enabled."
  value       = module.acr.admin_password
  sensitive   = true
}

output "admin_username" {
  description = "The Username associated with the Container Registry Admin account - if the admin account is enabled."
  value       = module.acr.admin_username
}

output "anonymous_pull_enabled" {
  description = "The ID of the Container Registry."
  value       = module.acr.anonymous_pull_enabled
}

output "data_endpoint_enabled" {
  description = "Whether to enable dedicated data endpoints for this Container Registry"
  value       = module.acr.data_endpoint_enabled
}

output "encryption" {
  description = "An encryption block as documented below."
  value       = module.acr.encryption
}

output "export_policy_enabled" {
  description = "Boolean value that indicates whether export policy is enabled."
  value       = module.acr.export_policy_enabled
}

output "id" {
  description = "The ID of the Container Registry."
  value       = module.acr.id
}

output "location" {
  description = "Specifies the supported Azure location where the resource exists."
  value       = module.acr.location
}

output "login_server" {
  description = "The URL that can be used to log into the container registry."
  value       = module.acr.login_server
}

output "name" {
  description = "Specifies the name of the Container Registry."
  value       = module.acr.name
}

output "network_rule_bypass_option" {
  description = "Whether to allow trusted Azure services to access a network restricted Container Registry"
  value       = module.acr.network_rule_bypass_option
}

output "network_rule_set" {
  description = "Network configuration for IPv4 block."
  value       = module.acr.network_rule_set
}

output "public_network_access_enabled" {
  description = "The ID of the Container Registry."
  value       = module.acr.public_network_access_enabled
}

output "quarantine_policy_enabled" {
  description = "Boolean value that indicates whether quarantine policy is enabled."
  value       = module.acr.quarantine_policy_enabled
}

output "resource_group_name" {
  description = "The name of the resource group in which to create the Container Registry. "
  value       = module.acr.resource_group_name
}

output "retention_policy" {
  description = "A retention_policy block as documented below."
  value       = module.acr.retention_policy
}

output "sku" {
  description = "The SKU name of the container registry."
  value       = module.acr.sku
}

output "trust_policy" {
  description = "Boolean value that indicates whether the policy is enabled."
  value       = module.acr.trust_policy
}

output "zone_redundancy_enabled" {
  description = "Whether zone redundancy is enabled for this Container Registry"
  value       = module.acr.zone_redundancy_enabled
}