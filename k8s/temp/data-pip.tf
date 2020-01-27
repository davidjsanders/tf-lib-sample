data "azurerm_public_ip" "attached-pip" {
    depends_on = [
        module.k8s-jumpbox
    ]

    name                = module.k8s-jumpbox.pip-name
    resource_group_name = module.k8s-jumpbox.rg-name
}