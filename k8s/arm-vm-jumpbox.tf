module "vm-jumpbox" {
    source = "git@github.com:dgsd-consulting/tf-library.git//azure/linux-jumpbox"
    linux-jumpbox = {
        admin-user              = var.jumpbox.admin-user
        availability-set-id     = ""
        boot-diags              = true
        boot-diags-sa-uri       = azurerm_storage_account.sa.primary_blob_endpoint
        custom-data             = ""
        delete-os-on-done       = true
        delete-data-on-done     = true
        disable-password-auth   = true
        location                = module.k8s-rg.location
        machine-size            = var.jumpbox.machine-size
        network                 = {
            pip-alloc             = "Dynamic"
            pip-domain-name-label = "dasander-jumpbox"
            pip-sku               = "Basic"
            private-ip-address    = ""
            private-ip-alloc      = "Dynamic"
            subnet-id             = module.k8s-network.subnet-ids[2]
        }
        os-disk-caching         = "ReadWrite"
        os-disk-create-option   = "FromImage"
        os-disk-disk-size-gb    = 0
        os-disk-managed-type    = "Premium_LRS"
        public-key              = file(var.jumpbox.public-key-file)
        randomizer              = local.l-random
        rg-name                 = module.k8s-rg.name
        server-name             = "JUMPBOX"
        storage-image-reference = format(
            "/subscriptions/%s/resourceGroups/%s/providers/Microsoft.Compute/images/%s",
            var.azure-secrets.subscription-id,
            var.jumpbox.image-rg,
            var.jumpbox.image-name
        )
    }
    tags         = var.tags
}