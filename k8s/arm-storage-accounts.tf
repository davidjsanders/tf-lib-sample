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
  location            = module.k8s-rg.location
  resource_group_name = module.k8s-rg.name
  tags                = var.tags
}



# module "k8s-storage-account" {
#   source          = "git@github.com:dgsd-consulting/tf-library.git//azure/lib/storage-account/"
#   storage-account = {
#     account-tier     = "Standard"
#     location         = module.k8s-rg.location
#     randomizer       = format(
#       "%s",
#       random_integer.unique-id.result
#     )
#     replication-type = "LRS"
#     rg-name          = module.k8s-rg.name
#     sa-name          = var.resources.sa-name
#   }
#   tags            = var.tags
# }
