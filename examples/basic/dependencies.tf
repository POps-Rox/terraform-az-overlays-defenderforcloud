# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

module "azure_region" {
  source = "github.com/POps-Rox/terraform-az-overlays-azregionslookup"

  azure_region = var.azure_region
}

module "rg" {
  source = "github.com/POps-Rox/terraform-az-overlays-resourcegroup"

  location                = module.azure_region.location_cli
  org_name                = var.org_name
  environment             = var.environment
  workload_name           = var.stack
  use_location_short_name = true
}
