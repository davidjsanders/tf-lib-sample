module "k8s-network" {
  source = "git@github.com:dgsd-consulting/tf-library.git//azure/3-tier-network/"

  network = {
    address-space   = var.network.address-space
    location        = module.k8s-rg.location
    nsg-ids         = [
      module.k8s-nsg-masters.id,
      module.k8s-nsg-workers.id,
      module.k8s-nsg-jumpbox.id
    ]
    randomizer      = local.l-random
    rg-name         = module.k8s-rg.name
    subnet-names    = var.network.subnet-names
    subnet-prefixes = var.network.subnet-prefixes
    vnet-name       = var.resources.name-prefix
  }
  tags    = var.tags
}
