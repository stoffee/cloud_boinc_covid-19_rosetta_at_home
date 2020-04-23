resource "azurerm_resource_group" "rosetta" {
  name     = "${var.prefix}-resources"
  location = var.location
}