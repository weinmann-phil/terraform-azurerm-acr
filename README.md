# terraform-azurerm-acr

## Deploys a Container Registry on Azure using ACR (Azure Container Registry)

-> **Note:** This module is still under construction.

### Structure

```bash
.
├── examples
│   ├── startup
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── providers.tf
│   │   ├── TestRecord.md
│   │   └── variables.tf
│   └── with_network_restriction
├── GNUmakefile
├── LICENSE
├── main.tf
├── outputs.tf
├── README.md
├── test
│   ├── e2e
│   ├── go.mod
│   ├── unit
│   │   └── unit_test.go
│   └── upgrade
├── unit-test-fixture
├── variables.tf
└── versions.tf

9 directories, 14 files
```

## Roadmap

- [X] Create module
- [X] Add example codes within `examples/`
  - [X] Startup
  - [ ] with IP Block
  - [ ] with Geo Replication
  - [ ] with Retention Policy
- [ ] Add test cases for module
- [ ] Add `pre-commit` linting, scans, and validations
- [ ] Finish `README.md`

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.90 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.90.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_container_registry.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_cidrs"></a> [allowed\_cidrs](#input\_allowed\_cidrs) | (Optional) The IP ranges to allow for incoming traffic to the registry. The allowed CIRDs are only supported on resources with `Premium` SKU | `list(string)` | `[]` | no |
| <a name="input_allowed_subnets"></a> [allowed\_subnets](#input\_allowed\_subnets) | (Optional) The subnets to allow for incoming traffic to the registry. | `list(string)` | `[]` | no |
| <a name="input_data_endpoint_enabled"></a> [data\_endpoint\_enabled](#input\_data\_endpoint\_enabled) | (Optional) Option to enable dedicated data endpoints for the container registry. Option only supported with `Premium` SKU. | `bool` | `false` | no |
| <a name="input_enable_image_retention"></a> [enable\_image\_retention](#input\_enable\_image\_retention) | (Optional) Sets the retention policy block. This block is only supported with the `Premium` SKU. | `bool` | `false` | no |
| <a name="input_enable_trust_policy"></a> [enable\_trust\_policy](#input\_enable\_trust\_policy) | (Optional) Boolean value indicating that the policy is enabled. This block is supported only in `Premium` SKU. | `bool` | `false` | no |
| <a name="input_geo_redundant_locations"></a> [geo\_redundant\_locations](#input\_geo\_redundant\_locations) | (Optional) A set of obects with definitions of georeplication data | `set(any)` | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_network_rule_bypass_option"></a> [network\_rule\_bypass\_option](#input\_network\_rule\_bypass\_option) | (Optional) Allow Azure service to have access to the container registry. Possible values are `AzureServices` or `None`. | `string` | `"AzureServices"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | (Optional) The prefix for the resources created in the specified Azure Resource Group. Omitting this variable requires both `var.cluster_log_analytics_workspace_name` and `var.registry_name` have been set. | `string` | `""` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | (Optional) Option to allow public network access to container registry. Defaults to `true` | `bool` | `true` | no |
| <a name="input_registry_name"></a> [registry\_name](#input\_registry\_name) | (Optional) Specifies the name of the Container Registry. Only Alphanumeric characters allowed. Changing this forces a new resource to be created | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group in which to create the Container Registry. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_retention_period"></a> [retention\_period](#input\_retention\_period) | (Optional) The number of days to retain an untagged manifest after which it gets purged. Defaults to 7. | `number` | `7` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | (Optional) The SKU name of the container registry. Possible values are `Basic`, `Standard`, and `Premium` | `string` | `"Basic"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Any tags that should be present on the ACR resources | `map(string)` | `{}` | no |
| <a name="input_tracing_tags_enabled"></a> [tracing\_tags\_enabled](#input\_tracing\_tags\_enabled) | (Optional) Option to enable tracing tags generated by BdrigeCrew Yor. | `bool` | `false` | no |
| <a name="input_tracing_tags_prefix"></a> [tracing\_tags\_prefix](#input\_tracing\_tags\_prefix) | (Optional) Sets the default prefix for generated tracing tags. | `string` | `"avm_"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acr_module"></a> [acr\_module](#output\_acr\_module) | Obect with entirety of valid container registry outputs. |
| <a name="output_admin_enabled"></a> [admin\_enabled](#output\_admin\_enabled) | The ID of the Container Registry. |
| <a name="output_admin_password"></a> [admin\_password](#output\_admin\_password) | The Password associated with the Container Registry Admin account - if the admin account is enabled. |
| <a name="output_admin_username"></a> [admin\_username](#output\_admin\_username) | The Username associated with the Container Registry Admin account - if the admin account is enabled. |
| <a name="output_anonymous_pull_enabled"></a> [anonymous\_pull\_enabled](#output\_anonymous\_pull\_enabled) | The ID of the Container Registry. |
| <a name="output_data_endpoint_enabled"></a> [data\_endpoint\_enabled](#output\_data\_endpoint\_enabled) | Whether to enable dedicated data endpoints for this Container Registry |
| <a name="output_encryption"></a> [encryption](#output\_encryption) | An encryption block as documented below. |
| <a name="output_export_policy_enabled"></a> [export\_policy\_enabled](#output\_export\_policy\_enabled) | Boolean value that indicates whether export policy is enabled. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Container Registry. |
| <a name="output_location"></a> [location](#output\_location) | Specifies the supported Azure location where the resource exists. |
| <a name="output_login_server"></a> [login\_server](#output\_login\_server) | The URL that can be used to log into the container registry. |
| <a name="output_name"></a> [name](#output\_name) | Specifies the name of the Container Registry. |
| <a name="output_network_rule_bypass_option"></a> [network\_rule\_bypass\_option](#output\_network\_rule\_bypass\_option) | Whether to allow trusted Azure services to access a network restricted Container Registry |
| <a name="output_network_rule_set"></a> [network\_rule\_set](#output\_network\_rule\_set) | Network configuration for IPv4 block. |
| <a name="output_public_network_access_enabled"></a> [public\_network\_access\_enabled](#output\_public\_network\_access\_enabled) | The ID of the Container Registry. |
| <a name="output_quarantine_policy_enabled"></a> [quarantine\_policy\_enabled](#output\_quarantine\_policy\_enabled) | Boolean value that indicates whether quarantine policy is enabled. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The name of the resource group in which to create the Container Registry. |
| <a name="output_retention_policy"></a> [retention\_policy](#output\_retention\_policy) | A retention\_policy block as documented below. |
| <a name="output_sku"></a> [sku](#output\_sku) | The SKU name of the container registry. |
| <a name="output_trust_policy"></a> [trust\_policy](#output\_trust\_policy) | Boolean value that indicates whether the policy is enabled. |
| <a name="output_zone_redundancy_enabled"></a> [zone\_redundancy\_enabled](#output\_zone\_redundancy\_enabled) | Whether zone redundancy is enabled for this Container Registry |
<!-- END_TF_DOCS -->

## References

- [Terraform Documentation - Creating Modules](https://developer.hashicorp.com/terraform/language/modules/develop)
- [Google Documentation - Best practices for using Terraform](https://cloud.google.com/docs/terraform/best-practices-for-terraform)