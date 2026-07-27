output "private_dns_zone_id" {
  description = "ID da Private DNS Zone criada"
  value       = azurerm_private_dns_zone.dns_zone.id
}

output "private_dns_zone_name" {
  description = "Nome da Private DNS Zone"
  value       = azurerm_private_dns_zone.dns_zone.name
}

output "a_record_ids" {
  description = "IDs dos registros A criados (map by record name)"
  value       = { for k, r in azurerm_private_dns_a_record.records : k => r.id }
}

output "vnet_link_id" {
  description = "ID do link com a VNet (se criado)"
  value       = length(azurerm_private_dns_zone_virtual_network_link.vnet_link) > 0 ? azurerm_private_dns_zone_virtual_network_link.vnet_link[0].id : ""
}
