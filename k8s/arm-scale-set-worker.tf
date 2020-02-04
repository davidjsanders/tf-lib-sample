module "worker-scale-set" {
    source = "git@github.com:dgsd-consulting/tf-library.git//azure/linux-vm-scale-set"
    scale-set = {
        boot-diagnostics = {
            enable = true
            uri    = azurerm_storage_account.sa.primary_blob_endpoint
        }
        data-disk        = [{
            caching        = "ReadWrite"
            create-option  = "Empty"
            disk-size-gb   = 100
            lun            = 1
            managed-type   = "Premium_LRS"
        }]
        location         = azurerm_resource_group.k8s-rg.location
        network          = {
            lb-backend-address-pool-ids = []
            lb-inbound-nat-rules-ids    = []
            private-ip-address          = ""
            private-ip-alloc            = "Dynamic"
            public-ip-id                = ""
            subnet-id                   = module.k8s-network.subnets.*.id[1]
        }
        os               = {
            admin-user              = var.jumpbox.admin-user
            custom-data             = ""
            disable-password-auth   = true
            hostname                = "test-vm"
            private-key-filename    = var.master.private-key-file
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
        rg-name          = azurerm_resource_group.k8s-rg.name
        scale-set-name   = "WORKERS-SCALE-SET"
        server           = {
            capacity            = 2
            machine-size        = var.master.machine-size
            server-name         = "WORKER"
            tier                = "Standard"
            upgrade-policy-mode = "Manual"
        }
    }
    tags         = var.tags
}