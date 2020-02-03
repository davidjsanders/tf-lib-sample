resource "azurerm_storage_account" "sa" {
  account_tier             = "Standard"
  account_replication_type = "LRS"
  name                     = lower(
    format(
      "%s%s",
      substr(
        "dasanderk8s",
        0,
        20
      ),
      random_integer.unique-id.result
    )
  )
  location            = azurerm_resource_group.k8s-rg.location
  resource_group_name = azurerm_resource_group.k8s-rg.name
  tags                = var.tags
}
