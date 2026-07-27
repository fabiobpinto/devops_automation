output "id" {
  description = "ID da Route Table"
  value       = azurerm_route_table.route_table.id
}

output "name" {
  description = "Nome da Route Table"
  value       = azurerm_route_table.route_table.name
}
