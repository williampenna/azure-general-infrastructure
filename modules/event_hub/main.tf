variable "RESOURCE_GROUP" {}
variable "LOCATION" {}

resource "azurerm_eventhub_namespace" "event_hub_namespace" {
  name                = "testWillEHN"
  location            = var.LOCATION
  resource_group_name = var.RESOURCE_GROUP
  sku                 = "Standard"
  capacity            = 1

  tags = {
    environment = "develop"
  }
}

resource "azurerm_eventhub" "event_hub" {
  name                = "goodbye"
  namespace_name      = azurerm_eventhub_namespace.event_hub_namespace.name
  resource_group_name = var.RESOURCE_GROUP
  partition_count     = 1
  message_retention   = 1
}

resource "azurerm_eventhub_authorization_rule" "eh_auth_rule" {
  name                = "testEventHubRule"
  namespace_name      = azurerm_eventhub_namespace.event_hub_namespace.name
  eventhub_name       = azurerm_eventhub.event_hub.name
  resource_group_name = var.RESOURCE_GROUP
  listen              = true
  send                = true
  manage              = true
}

