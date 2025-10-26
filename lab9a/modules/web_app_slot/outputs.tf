output "slot_id" {
  value = azurerm_linux_web_app_slot.slot.id
}

output "slot_hostname" {
  value = azurerm_linux_web_app_slot.slot.default_hostname
}
