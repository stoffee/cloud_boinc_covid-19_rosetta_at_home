output "azure_instance_info" {
  value = <<INSTANCEIP

Your Rosetta@home Azure instance has been created
  $ ssh  ${var.ssh_admin_username}@${data.azurerm_public_ip.rosetta-public-ip.ip_address}
  password: ${var.ssh_admin_password}

INSTANCEIP