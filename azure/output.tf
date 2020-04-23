output "appGatewayIp" {
  value = data.azurerm_public_ip.rosetta-public-ip.ip_address
}