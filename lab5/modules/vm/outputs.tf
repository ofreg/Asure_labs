output "private_ip" {
  value = azurerm_network_interface.nic.private_ip_address
}

output "public_ip" {
  value = null
}
output "vm_id" {
  value = azurerm_windows_virtual_machine.vm.id
}