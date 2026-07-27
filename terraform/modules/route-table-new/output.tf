output "name" {
  description = "Nome da Route Table"
  value       = azurerm_route_table.udr.name
}

output "id" {
  description = "ID da Route Table"
  value       = azurerm_route_table.udr.id
}

output "resource" {
  description = "Objeto completo da Route Table"
  value       = azurerm_route_table.udr
}
