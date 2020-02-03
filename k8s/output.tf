output "jumpbox-fqdn" {
    value = module.vm-jumpbox.fqdn
}

output "jumpbox-ip" {
    value = module.vm-jumpbox.public-ip
}