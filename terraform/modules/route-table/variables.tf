variable "name" {
  description = "Nome da Route Table"
  type        = string
}

variable "location" {
  description = "Região Azure"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group da Route Table"
  type        = string
}

variable "routes" {
  description = "Mapa de rotas da UDR"
  type = map(object({
    prefix   = string
    hop_type = string
    hop_ip   = optional(string)
  }))
  default = {}
}

variable "subnets" {
  description = "Mapa de subnets (nome => subnet_id)"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags aplicadas ao recurso"
  type        = map(string)
  default     = {}
}
