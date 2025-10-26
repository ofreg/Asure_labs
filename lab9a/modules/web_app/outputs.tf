output "webapp_id" {
  value = azurerm_linux_web_app.web.id
}

output "default_hostname" {
  value = azurerm_linux_web_app.web.default_hostname
}
