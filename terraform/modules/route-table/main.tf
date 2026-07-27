resource "azurerm_route_table" "route_table" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}

resource "azurerm_route" "route" {
  for_each = var.routes

  name                = each.key
  resource_group_name = var.resource_group_name
  route_table_name    = azurerm_route_table.route_table.name
  address_prefix      = each.value.prefix
  next_hop_type       = each.value.hop_type
  # next_hop_in_ip_address = lookup(each.value, "hop_ip", null)
  next_hop_in_ip_address = try(each.value.hop_ip, null)
}

resource "azurerm_subnet_route_table_association" "association" {
  count = length(var.subnets)

  subnet_id      = values(var.subnets)[count.index]
  route_table_id = azurerm_route_table.route_table.id
}