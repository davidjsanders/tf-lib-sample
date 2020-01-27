module "vm" {
    source = "git@github.com:dgsd-consulting/tf-library.git//azure/linux-server"
    linux-server = {
        admin-user              = var.jumpbox.admin-user
        availability-set-id     = ""
        boot-diags              = true
        boot-diags-sa-uri       = azurerm_storage_account.sa.primary_blob_endpoint
        custom-data             = ""
        data-disks = [
            {
                caching           = "ReadWrite"
                create-option     = "Empty"
                disk-name         = "DISK"
                disk-size-gb      = 32
                managed-disk-type = "Premium_LRS"
            }
        ]
        delete-os-on-done       = true
        delete-data-on-done     = true
        disable-password-auth   = true
        location                = module.k8s-rg.location
        machine-size            = var.master.machine-size
        network                 = {
            private-ip-address = ""
            private-ip-alloc   = "Dynamic"
            public-ip-id       = ""
            subnet-id          = module.k8s-network.subnet-ids[2]
        }
        os-disk-caching         = "ReadWrite"
        os-disk-create-option   = "FromImage"
        os-disk-disk-size-gb    = 0
        os-disk-managed-type    = "Premium_LRS"
        public-key              = file(var.master.public-key-file)
        randomizer              = local.l-random
        rg-name                 = module.k8s-rg.name
        server-count            = 1
        server-name             = "TEST-VM"
        storage-image-reference = format(
            "/subscriptions/%s/resourceGroups/%s/providers/Microsoft.Compute/images/%s",
            var.azure-secrets.subscription-id,
            var.master.image-rg,
            var.master.image-name
        )
    }
    tags         = var.tags
}