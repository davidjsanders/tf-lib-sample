module "vm" {
    source = "git@github.com:dgsd-consulting/tf-library.git//azure/linux-server"
    linux-server = {
        boot-diagnostics = {
            enable = true
            uri    = azurerm_storage_account.sa.primary_blob_endpoint
        }
        location         = module.k8s-rg.location
        network          = {
            private-ip-address = ""
            private-ip-alloc   = "Dynamic"
            public-ip-id       = ""
            subnet-id          = module.k8s-network.subnet-ids[2]
        }
        os               = {
            admin-user              = var.jumpbox.admin-user
            custom-data             = ""
            disable-password-auth   = true
            hostname                = "test-vm"
            public-key              = file(var.master.public-key-file)
            storage-image-reference = format(
                "/subscriptions/%s/resourceGroups/%s/providers/Microsoft.Compute/images/%s",
                var.azure-secrets.subscription-id,
                var.master.image-rg,
                var.master.image-name
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
            machine-size        = var.master.machine-size
            server-name         = "TEST-VM"
            server-count        = 1
        }
    }
    tags         = var.tags
}