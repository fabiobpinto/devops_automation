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
# Variables for VM
#########################################################
variable "vm_linux_name" {
  type        = string
  description = "The name of the virtual machine."
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet to attach to the VM."
}

#########################################################
# Variables  Tags
#########################################################
variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resources."
}