output "jumpbox-ip" {
    value = data.azurerm_public_ip.attached-pip.ip_address
}

output "master-ip" {
    value = module.srv-master.private-ip
}

output "pip-name" {
    value = module.k8s-jumpbox.pip-name
}

output "jumpbox-name" {
    value = module.k8s-jumpbox.vm-name
}

# output "public-ip" {
#     value = data.azurerm_public_ip.provisioned-pip.ip_address
# }