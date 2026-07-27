variable "environment" {
  type        = string
  description = "Required. The environment that the resource will be created."
  validation {
    condition     = contains(["dv", "pr", "ho"], var.environment)
    error_message = "The specified environment is not in the list of allowed environment: ${join(", ", ["dv", "pr", "ho"])}."
  }
}

variable "location" {
  type        = string
  description = "Required. The Azure region for deployment of the this resource."
  validation {
    condition     = contains(["eastus"], var.location)
    error_message = "The specified region is not in the list of allowed regions: ${join(", ", ["eastus"])}."
  }
}

variable "tags" {
  type        = map(string)
  description = "value of tags to be applied to the resource"
}

variable "workload" {
  type        = string
  description = "Required. The name of the workload."
}

variable "domain" {
  type        = string
  description = "Required. The name of the domain."
}

variable "subnet_list" {
  type        = list(string)
  description = "The list of subnets associated with this route"
}

variable "udr" {
  description = "User Defined Route configuration"
  type = object({
    resource_group_name           = string
    disable_bgp_route_propagation = optional(bool, true)
    route = list(object({
      name                   = string
      address_prefix         = string
      next_hop_type          = string
      next_hop_in_ip_address = optional(string)
    }))
  })
}