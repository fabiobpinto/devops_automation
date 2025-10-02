#########################################################
# Variables for Resource Group
#########################################################
variable "rg_name" {
  type        = string
  description = "The name of the resource group."
}
variable "location" {
  type        = string
  description = "The Azure region where the resources will be deployed."
}

#########################################################
# Variables for Network Security Group and Rules
#########################################################
variable "nsg_name" {
  description = "Name of the Network Security Group"
  type        = string
}
variable "nsg_rules" {
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}

#########################################################
# Variables for VNet and Subnets
#########################################################
variable "vnet_name" {
  type        = string
  description = "The name of the virtual network."
}
variable "vnet_address_space" {
  type        = list(string)
  description = "The address space for the virtual network."
}
variable "vnet_subnets" {
  description = "Lista de subnets a serem criadas na VNet"
  type = list(object({
    name           = string
    address_prefix = string
  }))
}

#########################################################
# Variables  Tags
#########################################################
variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resources."
}