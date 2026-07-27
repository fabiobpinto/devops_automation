output "vms_web_public_ips" {
  description = "IPs públicos das VMs Web"
  value = {
    for k, v in module.vms_ansible :
    k => v.public_ip_address
    if v.public_ip_address != null
  }
}

# output "vms_web_private_ips" {
#   description = "Mapa com nome da VM e IP privado"
#   value = {
#     for vm_key, vm in module.vms_web :
#     vm.vm_name => vm.nic_private_ip
#   }
# }

# output "debug_vm_linux" {
#   value = var.vms_linux
# }