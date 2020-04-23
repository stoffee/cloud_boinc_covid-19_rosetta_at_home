resource "azurerm_virtual_machine" "rosetta" {
  name                  = var.prefix
  location              = azurerm_resource_group.rosetta.location
  resource_group_name   = azurerm_resource_group.rosetta.name
  network_interface_ids = [azurerm_network_interface.rosetta.id]
  vm_size               = "Standard_F2"

  # This means the OS Disk will be deleted when Terraform destroys the Virtual Machine
  # NOTE: This may not be optimal in all cases.
  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.prefix}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${var.prefix}-${random_pet.server.id}"
    admin_username = var.ssh_admin_username
    admin_password = var.ssh_admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  provisioner "remote-exec" {
    connection {
      host     = data.azurerm_public_ip.rosetta-public-ip.ip_address
      type     = "ssh"
      user     = var.ssh_admin_username
      password = var.ssh_admin_password
    }

    inline = [
      "ls -la",
      "sudo apt update && sudo apt install -y unzip jq boinc-client dnsutils",
      "sleep 15",
      "sudo systemctl restart boinc-client",
      "sleep 15",
      "sudo boinccmd --project_attach http://boinc.bakerlab.org/rosetta 51f200480b1473b1b972f89b051a31d3",
      "sleep 15",
      "sudo systemctl restart boinc-client",
    ]
  }
}

#locals {
#  virtual_machine_name = "${var.prefix}-${random_pet.server.id}"
#  admin_username       = var.admin_username
#  admin_password       = var.admin_password
#}
