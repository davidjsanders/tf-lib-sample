module "srv-workers" {
  source          = "git@github.com:dgsd-consulting/tf-library.git//azure/linux-server/"

  linux-server    = {
    admin-user              = var.jumpbox.admin-user
    location                = module.k8s-rg.location
    machine-size            = var.jumpbox.machine-size
    pip-id                  = ""
    public-key              = file(var.jumpbox.public-key-file)
    randomizer              = local.l-random
    rg-name                 = module.k8s-rg.name
    server-count            = 3
    server-name             = format(
      "%s-worker",
      var.resources.name-prefix
    )
    storage-account-uri     = module.k8s-storage-account.primary_blob_endpoint
    subnet-id               = module.k8s-network.subnet-ids[1]
    storage-image-reference = format(
      "/subscriptions/%s/resourceGroups/%s/providers/Microsoft.Compute/images/%s",
      var.azure-secrets.subscription-id,
      var.jumpbox.image-rg,
      var.jumpbox.image-name
    )
  }
  tags            = var.tags
}
