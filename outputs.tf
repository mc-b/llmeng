###
#   Outputs wie IP-Adresse und DNS Name
#  

output "ip_vm" {
  value       = module.control.ip_vm
  description = "The IP address of the server instance."
}

output "fqdn_vm" {
  value       = module.control.fqdn_vm
  description = "The FQDN of the server instance."
}

output "description" {
  value       = module.control.description
  description = "Description VM"
}

# Einfuehrungsseite(n)


output "README" {
  value = templatefile("INTRO.md", {
    ip      = module.control.ip_vm,
    fqdn    = module.control.fqdn_vm,
  })
}

