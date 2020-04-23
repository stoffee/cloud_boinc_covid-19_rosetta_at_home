resource "azurerm_virtual_network" "rosetta" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rosetta.location
  resource_group_name = azurerm_resource_group.rosetta.name
}

resource "azurerm_subnet" "rosetta" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.rosetta.name
  virtual_network_name = azurerm_virtual_network.rosetta.name
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_public_ip" "rosetta" {
  name                = "${var.prefix}-publicip"
  resource_group_name = azurerm_resource_group.rosetta.name
  location            = azurerm_resource_group.rosetta.location
  allocation_method   = "Static"
}

data "azurerm_public_ip" "rosetta-public-ip" {
  name                = azurerm_public_ip.rosetta.name
  resource_group_name = azurerm_resource_group.rosetta.name
  depends_on = [data.azurerm_public_ip.rosetta-public-ip]
}


resource "azurerm_network_interface" "rosetta" {
  name                = "${var.prefix}-nic"
  location            = azurerm_resource_group.rosetta.location
  resource_group_name = azurerm_resource_group.rosetta.name

  ip_configuration {
    name                          = "configuration"
    subnet_id                     = azurerm_subnet.rosetta.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.rosetta.id
  }
}

