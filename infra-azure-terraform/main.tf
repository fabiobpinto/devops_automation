module "resource_group" {
  source   = "./modules/resource_group"
  rg_name  = var.rg_name
  location = var.location
  tags     = var.tags
}

module "network" {
  source             = "./modules/network"
  rg_name            = module.resource_group.rg_name
  location           = module.resource_group.location
  nsg_name           = var.nsg_name
  nsg_rules          = var.nsg_rules
  vnet_name          = var.vnet_name
  vnet_address_space = var.vnet_address_space
  vnet_subnets       = var.vnet_subnets
  tags               = var.tags
}

module "vm_linux" {
  source        = "./modules/vm-linux"
  rg_name       = module.resource_group.rg_name
  location      = module.resource_group.location
  vm_linux_name = var.vm_linux_name
  subnet_id     = module.network.subnet_ids[var.vm_linux_subnet_id]
  tags          = var.tags

}