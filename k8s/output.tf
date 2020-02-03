# output "public-ip" {
#     value = azurerm_public_ip.jumpbox-pip.ip_address
# }
output "public-ip" {
    value = module.vm-jumpbox.
}