resource "azurerm_route_table" "udr" {
  name                          = "rt${var.environment}${var.domain}${var.workload}"
  resource_group_name           = var.udr.resource_group_name
  location                      = var.location
  bgp_route_propagation_enabled = var.udr.disable_bgp_route_propagation

  dynamic "route" {
    for_each = var.udr.route
    content {
      name                   = route.value.name
      address_prefix         = route.value.address_prefix
      next_hop_type          = route.value.next_hop_type
      next_hop_in_ip_address = route.value.next_hop_in_ip_address
    }
  }
  tags = var.tags
}

resource "azurerm_subnet_route_table_association" "udr_snet" {
  count          = length(var.subnet_list)
  subnet_id      = var.subnet_list[count.index]
  route_table_id = azurerm_route_table.udr.id
}
