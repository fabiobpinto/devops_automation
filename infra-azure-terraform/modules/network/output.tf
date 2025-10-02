output "nsg_name" {
  value       = azurerm_network_security_group.nsg.name
  description = "The name of the Network Security Group."
}
# output "subnet_ids" {
#   description = "Subnet IDs"
#   value = {
#     for sn, subnet in azurerm_subnet.vnet_subnet :
#     sn => {
#       name = subnet.name
#       ip   = subnet.address_prefixes[0]
#     }
#   }
# }
output "subnet_ids" {
  description = "IDs das subnets"
  value       = { for s in azurerm_subnet.vnet_subnet : s.name => s.id }
}