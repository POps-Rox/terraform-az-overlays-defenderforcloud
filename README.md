<!-- BADGES:START -->
[![CI](https://github.com/POps-Rox/tf-az-overlays-defenderforcloud/actions/workflows/ci.yml/badge.svg)](https://github.com/POps-Rox/tf-az-overlays-defenderforcloud/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/POps-Rox/tf-az-overlays-defenderforcloud/pulls)
[![Maintained](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/POps-Rox/tf-az-overlays-defenderforcloud/graphs/commit-activity)
[![Terraform](https://img.shields.io/badge/Terraform-%3E%3D1.5-623CE4.svg?logo=terraform)](https://www.terraform.io)
<!-- BADGES:END -->

# Azure Security Center Overlay Terraform Module

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![MIT License](https://img.shields.io/badge/license-MIT-orange.svg)](LICENSE) [![GitHub](https://img.shields.io/badge/github-POps--Rox-blue.svg)](https://github.com/POps-Rox/terraform-az-overlays-defenderforcloud)

This Overlay terraform module can create an [Azure Security Center](https://docs.microsoft.com/en-us/azure/security-center/) and manage related parameters to be used in a [SCCA compliant Network](https://github.com/POps-Rox/terraform-az-overlays-hubspoke).

## SCCA Compliance

This module can be SCCA compliant and can be used in a SCCA compliant Network. Enable SCCA compliant network rules to make it SCCA compliant.

For more information, please read the [SCCA documentation]("https://www.cisa.gov/secure-cloud-computing-architecture").

## Contributing

If you want to contribute to this repository, feel free to to contribute to our Terraform module.

More details are available in the [CONTRIBUTING.md](./CONTRIBUTING.md#pull-request-process) file.

## Resources Used

* [Azure Security Center](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/security_center_subscription_pricing)

## Overlay Module Usage for Azure Security Center

```terraform
# Azurerm Provider configuration
provider "azurerm" {
  features {}
}
```