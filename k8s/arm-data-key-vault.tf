data "azurerm_key_vault" "secrets-kv" {
    name                = var.azure-secrets.key-vault-name
    resource_group_name = var.azure-secrets.key-vault-rg-name
}