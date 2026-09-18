mock_provider "azurerm" {}

run "default_pricing_and_contact" {
  command = plan

  variables {
    security_center_contact_email = "security@example.com"
    security_center_contact_phone = "+1-555-0100"
  }

  assert {
    condition     = length(azurerm_security_center_subscription_pricing.pricing) == 8
    error_message = "Default Defender for Cloud pricing should cover the eight default resource types."
  }

  assert {
    condition     = azurerm_security_center_subscription_pricing.pricing["StorageAccounts"].tier == "Standard"
    error_message = "Default pricing tier should be Standard."
  }

  assert {
    condition     = azurerm_security_center_contact.contact.email == "security@example.com"
    error_message = "Security contact email should come from the required input."
  }

  assert {
    condition     = azurerm_security_center_contact.contact.phone == "+1-555-0100"
    error_message = "Security contact phone should come from the required input."
  }

  assert {
    condition     = length(azurerm_security_center_workspace.security_workspace) == 0
    error_message = "No Security Center workspace links should be created by default."
  }
}

run "custom_pricing_notifications_and_workspaces" {
  command = plan

  variables {
    security_center_contact_email = "defender@example.com"
    security_center_contact_phone = "+1-555-0199"
    security_center_pricing_tier  = "Free"
    security_center_pricing_resource_types = [
      "StorageAccounts",
      "VirtualMachines",
    ]
    security_center_alert_notifications = false
    security_center_alerts_to_admins    = false
    security_center_workspaces = [
      {
        scope_id     = "/subscriptions/00000000-0000-0000-0000-000000000000"
        workspace_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg/providers/Microsoft.OperationalInsights/workspaces/law-sub"
      },
      {
        scope_id     = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg"
        workspace_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg/providers/Microsoft.OperationalInsights/workspaces/law-rg"
      },
    ]
  }

  assert {
    condition     = length(azurerm_security_center_subscription_pricing.pricing) == 2
    error_message = "Pricing resources should be created only for the requested resource types."
  }

  assert {
    condition     = azurerm_security_center_subscription_pricing.pricing["VirtualMachines"].tier == "Free"
    error_message = "Custom pricing tier should be applied to requested resource types."
  }

  assert {
    condition     = azurerm_security_center_contact.contact.alert_notifications == false
    error_message = "Security contact alert notification preference should come from input."
  }

  assert {
    condition     = azurerm_security_center_contact.contact.alerts_to_admins == false
    error_message = "Security contact admin alert preference should come from input."
  }

  assert {
    condition     = length(azurerm_security_center_workspace.security_workspace) == 2
    error_message = "Workspace links should be created for each supplied scope."
  }

  assert {
    condition     = azurerm_security_center_workspace.security_workspace["/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg"].workspace_id == "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg/providers/Microsoft.OperationalInsights/workspaces/law-rg"
    error_message = "Workspace links should be keyed by scope_id and preserve workspace_id."
  }
}
