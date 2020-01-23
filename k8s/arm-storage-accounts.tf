module "k8s-storage-account" {
  source          = "git@github.com:dgsd-consulting/tf-library.git//azure/lib/storage-account/"
  storage-account = {
    account-tier     = "Standard"
    location         = module.k8s-rg.location
    randomizer       = format(
      "%s",
      random_integer.unique-id.result
    )
    replication-type = "LRS"
    rg-name          = module.k8s-rg.name
    sa-name          = var.resources.sa-name
  }
  tags            = var.tags
}
