resource "azurerm_public_ip" "lb-pip" {
    allocation_method   = "Static"
    location            = azurerm_resource_group.k8s-rg.location
    name                = "K8S-LB-PIP"
    resource_group_name = azurerm_resource_group.k8s-rg.name
    sku                 = "Basic"

    tags = var.tags
}