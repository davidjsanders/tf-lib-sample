output "jumpbox-fqdn" {
    value = module.vm-jumpbox.fqdn
}

output "jumpbox-ip" {
    value = module.vm-jumpbox.public-ip
}

output "master-ips" {
    value = module.vm-masters.nic-private-ips
}

output "worker-ips" {
    value = module.vm-workers.nic-private-ips
}