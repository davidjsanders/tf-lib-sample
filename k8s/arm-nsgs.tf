resource "azurerm_network_security_group" "k8s-nsg-masters" {
  name                = upper(
    format(
      "NSG-%s-masters%s",
      var.resources.name-prefix,
      local.l-random
    )
  )
  location            = azurerm_resource_group.k8s-rg.location
  resource_group_name = azurerm_resource_group.k8s-rg.name
  tags                = var.tags
}

resource "azurerm_network_security_group" "k8s-nsg-workers" {
  name                = upper(
    format(
      "NSG-%s-workers%s",
      var.resources.name-prefix,
      local.l-random
    )
  )
  location            = azurerm_resource_group.k8s-rg.location
  resource_group_name = azurerm_resource_group.k8s-rg.name
  tags                = var.tags
}

resource "azurerm_network_security_group" "jumpbox-nsg" {
  name                = upper(
    format(
      "NSG-%s-jumpbox%s",
      var.resources.name-prefix,
      local.l-random
    )
  )
  location            = azurerm_resource_group.k8s-rg.location
  resource_group_name = azurerm_resource_group.k8s-rg.name
  tags                = var.tags
}