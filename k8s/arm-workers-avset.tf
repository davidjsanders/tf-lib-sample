resource "azurerm_availability_set" "k8s-workers" {
    location = azurerm_resource_group.k8s-rg.location

    managed  = true
    name = "K8S-AVSET-WORKERS"
    platform_fault_domain_count  = "3"
    platform_update_domain_count = "5"
    resource_group_name          = azurerm_resource_group.k8s-rg.name

    tags = var.tags
}