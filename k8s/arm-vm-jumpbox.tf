module "vm-jumpbox" {
    source = "git@github.com:dgsd-consulting/tf-library.git//azure/linux-jumpbox"
    linux-jumpbox = {
        boot-diagnostics = {
            enable = true
            uri    = azurerm_storage_account.sa.primary_blob_endpoint
        }
        location         = module.k8s-rg.location
        network          = {
            nsg-name              = module.k8s-nsg-jumpbox.name
            nsg-rule-priority     = 1000
            pip-alloc             = "Dynamic"
            pip-domain-name-label = "dasander-jumpbox"
            pip-sku               = "Basic"
            private-ip-address    = ""
            private-ip-alloc      = "Dynamic"
            subnet-id             = module.k8s-network.subnet-ids[2]
        }
        os               = {
            admin-user              = var.jumpbox.admin-user
            custom-data             = ""
            disable-password-auth   = true
            hostname                = "jumpbox"
            public-key              = file(var.master.public-key-file)
            storage-image-reference = format(
                "/subscriptions/%s/resourceGroups/%s/providers/Microsoft.Compute/images/%s",
                var.azure-secrets.subscription-id,
                var.jumpbox.image-rg,
                var.jumpbox.image-name
            )
        }
        os-disk          = {
            caching        = "ReadWrite"
            create-option  = "FromImage"
            disk-size-gb   = 0
            managed-type   = "Premium_LRS"
            delete-on-done = true
        }
        randomizer       = local.l-random
        rg-name          = module.k8s-rg.name
        server           = {
            availability-set-id = ""
            machine-size        = var.jumpbox.machine-size
            server-name         = "JUMPBOX"
            server-count        = 1
        }
    }
    tags         = var.tags
}