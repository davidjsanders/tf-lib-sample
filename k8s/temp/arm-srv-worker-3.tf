module "srv-worker-3" {
  source          = "git@github.com:dgsd-consulting/tf-library.git//azure/linux-server/"

  linux-server    = {
    admin-user              = var.workers.admin-user
    availability-set-id     = ""
    boot-diags              = true
    boot-diags-sa-uri       = module.k8s-storage-account.primary_blob_endpoint
    custom-data             = ""
    location                = azurerm_resource_group.k8s-rg.location
    machine-size            = var.workers.machine-size
    nic-count               = 1
    pip-id                  = ""
    public-key              = file(var.workers.public-key-file)
    randomizer              = local.l-random
    name                 = azurerm_resource_group.k8s-rg.name
    server-name             = format(
      "%s-worker-03",
      var.resources.name-prefix
    )
    subnet-id               = module.k8s-network.subnet-ids[1]
    storage-image-reference = format(
      "/subscriptions/%s/resourceGroups/%s/providers/Microsoft.Compute/images/%s",
      var.azure-secrets.subscription-id,
      var.workers.image-rg,
      var.workers.image-name
    )
  }
  tags            = var.tags
}
