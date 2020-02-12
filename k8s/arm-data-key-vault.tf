data "azurerm_key_vault" "secrets-kv" {
    name                = var.secrets.key-vault-name
    resource_group_name = var.secrets.rg-name
}