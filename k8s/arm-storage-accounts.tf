module "k8s-storage-account" {
  source          = "git@github.com:dgsd-consulting/tf-library.git//azure/lib/storage-account/"
  storage-account = {
    account-tier     = "Standard"
    location         = module.k8s-rg.location
    replication-type = "LRS"
    rg-name          = module.k8s-rg.name
    sa-name          = format(
        "%s%04d",
        substr(var.resources.sa-prefix, 0, 20),
        random_integer.unique-id.result
      )
  }
  tags            = var.tags
}
