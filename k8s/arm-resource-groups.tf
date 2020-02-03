resource "azurerm_resource_group" "k8s-rg" {
  name     = upper(
    format(
      "RG-%s%s",
      var.rg.rg-name,
      local.l-random
    )
  )
  location = var.rg.location
  tags     = var.tags
}