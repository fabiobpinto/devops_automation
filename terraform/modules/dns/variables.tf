variable "zone_name" {
  description = "Nome da Private DNS Zone (ex: internal.contoso.com)"
  type        = string
}

variable "rg_name" {
  description = "Resource Group onde a zone será criada"
  type        = string
}

variable "records" {
  description = <<-EOT
Map de registros A. Chave = nome do registro (ex: app), value = objeto com:
- ips: lista de endereços IP (ex: ["10.0.0.4"])
- ttl: (opcional) TTL em segundos
EOT
  type        = map(any)
  default     = {}
}

variable "virtual_network_id" {
  description = "ID da VNet para link (ex: module.network.vnet_id)"
  type        = string
  default     = ""
}

variable "create_vnet_link" {
  description = "Se true, cria o link entre Private DNS Zone e a VNet especificada"
  type        = bool
  default     = false
}

variable "registration_enabled" {
  description = "Habilita auto-registration de VMs da VNet no Private DNS Zone"
  type        = bool
  default     = false
}

variable "link_name" {
  description = "Nome do link com a VNet (opcional). Se vazio usa <zone>-vnet-link"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags para aplicar aos recursos"
  type        = map(string)
  default     = {}
}
