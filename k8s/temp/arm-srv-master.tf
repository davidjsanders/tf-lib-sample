module "srv-master" {
  source          = "git@github.com:dgsd-consulting/tf-library.git//azure/linux-server/"

  linux-server    = {
    admin-user              = var.master.admin-user
    availability-set-id     = ""
    boot-diags              = true
    boot-diags-sa-uri       = module.k8s-storage-account.primary_blob_endpoint
    custom-data             = ""
    location                = module.k8s-rg.location
    machine-size            = var.master.machine-size
    nic-count               = 1
    pip-id                  = ""
    public-key              = file(var.master.public-key-file)
    randomizer              = local.l-random
    rg-name                 = module.k8s-rg.name
    server-name             = format(
      "%s-master",
      var.resources.name-prefix
    )
    storage-account-uri     = module.k8s-storage-account.primary_blob_endpoint
    subnet-id               = module.k8s-network.subnet-ids[0]
    storage-image-reference = format(
      "/subscriptions/%s/resourceGroups/%s/providers/Microsoft.Compute/images/%s",
      var.azure-secrets.subscription-id,
      var.master.image-rg,
      var.master.image-name
    )
  }
  tags            = var.tags
}
