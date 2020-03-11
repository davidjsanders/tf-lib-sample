output "ip" {
    value = module.vm-jumpbox.ip[0]
}

output "hostname" {
    value = module.vm-jumpbox.hostname[0]
}