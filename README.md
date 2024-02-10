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

## References

- [Terraform Documentation - Creating Modules](https://developer.hashicorp.com/terraform/language/modules/develop)