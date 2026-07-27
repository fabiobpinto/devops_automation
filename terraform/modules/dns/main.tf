resource "azurerm_private_dns_zone" "dns_zone" {
  name                = var.zone_name
  resource_group_name = var.rg_name
  tags                = var.tags
}

resource "azurerm_private_dns_a_record" "records" {
  for_each = var.records

  name                = each.key
  resource_group_name = azurerm_private_dns_zone.dns_zone.resource_group_name
  zone_name           = azurerm_private_dns_zone.dns_zone.name
  ttl                 = lookup(each.value, "ttl", 300)
  records             = lookup(each.value, "ips", [])
}

resource "azurerm_private_dns_zone_virtual_network_link" "vnet_link" {
  count = var.create_vnet_link ? 1 : 0

  name                  = var.link_name != "" ? var.link_name : "${var.zone_name}-vnet-link"
  resource_group_name   = var.rg_name
  private_dns_zone_name = azurerm_private_dns_zone.dns_zone.name
  virtual_network_id    = var.virtual_network_id
  registration_enabled  = var.registration_enabled
}

// Optional outputs for convenience are in outputs.tf
