locals {
  environment = terraform.workspace
}

resource "azurerm_resource_group" "aci_rg" {
  name     = "rg-vladimir-hellogo-aci-${local.environment}"
  location = "westeurope"

  tags = {
    project     = "hellogo"
    lesson      = "github-actions-aci"
    environment = local.environment
  }
}

resource "azurerm_container_group" "hellogo" {
  name                = "aci-hellogo-${local.environment}"
  location            = azurerm_resource_group.aci_rg.location
  resource_group_name = azurerm_resource_group.aci_rg.name
  os_type             = "Linux"

  ip_address_type = "Public"
  dns_name_label  = "vladimir-hellogo-aci-${local.environment}"

  container {
    name   = "hellogo"
    image  = "ghcr.io/vladtrubnikov1987/hellogo-pipeline/hellogo:latest"
    cpu    = 0.5
    memory = 1.0

    ports {
      port     = 8080
      protocol = "TCP"
    }
  }

  exposed_port {
    port     = 8080
    protocol = "TCP"
  }

  tags = {
    project     = "hellogo"
    lesson      = "github-actions-aci"
    environment = local.environment
  }
}

output "aci_url" {
  value = "http://${azurerm_container_group.hellogo.fqdn}:8080"
}