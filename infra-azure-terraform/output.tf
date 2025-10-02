output "public_ip_address" {
  value       = module.vm_linux.public_ip_address
  description = "The public IP address of the Linux VM."
}