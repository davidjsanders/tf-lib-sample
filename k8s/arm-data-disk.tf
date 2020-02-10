data "azurerm_managed_disk" "data-disk" {
    name                = var.master-data-disk.disk-name
    resource_group_name = var.master-data-disk.rg-name
}