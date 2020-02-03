module "k8s-network" {
  source = "git@github.com:dgsd-consulting/tf-library.git//azure/3-tier-network/"

  network = {
    address-space   = var.network.address-space
    location        = azurerm_resource_group.k8s-rg.location
    nsg-ids         = [
      azurerm_network_security_group.k8s-nsg-masters.id,
      azurerm_network_security_group.k8s-nsg-workers.id,
      azurerm_network_security_group.jumpbox-nsg.id
    ]
    randomizer      = local.l-random
    rg-name         = azurerm_resource_group.k8s-rg.name
    subnet-names    = var.network.subnet-names
    subnet-prefixes = var.network.subnet-prefixes
    vnet-name       = var.resources.name-prefix
  }
  tags    = var.tags
}
