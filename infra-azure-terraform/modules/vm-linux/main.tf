resource "azurerm_public_ip" "linux01_public_ip" {
  name                = "linux01-pip"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
}



resource "azurerm_network_interface" "nic_linux" {
  name                = "linux01-nic"
  resource_group_name = var.rg_name
  location            = var.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"

    public_ip_address_id = azurerm_public_ip.linux01_public_ip.id
  }
  tags = var.tags
}

resource "azurerm_linux_virtual_machine" "vm_linux" {
  name                = var.vm_linux_name
  resource_group_name = var.rg_name
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "adminfabio"
  network_interface_ids = [
    azurerm_network_interface.nic_linux.id
  ]

  admin_ssh_key {
    username   = "adminfabio"
    public_key = file("~/.ssh/admin.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  connection {
    type        = "ssh"
    host        = azurerm_public_ip.linux01_public_ip.ip_address
    user        = "adminfabio"
    private_key = file("~/.ssh/admin")
  }
  tags = var.tags
}


resource "azurerm_dev_test_global_vm_shutdown_schedule" "vm_shutdown" {
  virtual_machine_id = azurerm_linux_virtual_machine.vm_linux.id
  location           = var.location
  enabled            = true

  daily_recurrence_time = "1900"
  timezone              = "E. South America Standard Time"

  notification_settings {
    enabled         = false
    email           = "fabio.brito.pinto@avanade.com"
    time_in_minutes = "60"
  }

}