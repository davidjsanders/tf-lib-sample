module "k8s-nsg-masters" {
  source = "git@github.com:dgsd-consulting/tf-library.git//azure/lib/nsg/"
  nsg = {
    location = module.k8s-rg.location
    nsg-name = format(
      "%s-masters%s",
      var.resources.name-prefix
    )
    randomizer = local.l-random
    rg-name  = module.k8s-rg.name
  }
  tags = var.tags
}

module "k8s-nsg-workers" {
  source = "git@github.com:dgsd-consulting/tf-library.git//azure/lib/nsg/"
  nsg = {
    location = module.k8s-rg.location
    nsg-name = format(
      "%s-workers%s",
      var.resources.name-prefix
    )
    randomizer = local.l-random
    rg-name  = module.k8s-rg.name
  }
  tags = var.tags
}

module "k8s-nsg-jumpbox" {
  source = "git@github.com:dgsd-consulting/tf-library.git//azure/lib/nsg/"
  nsg = {
    location = module.k8s-rg.location
    nsg-name = format(
      "%s-jumpbox%s",
      var.resources.name-prefix
    )
    randomizer = local.l-random
    rg-name  = module.k8s-rg.name
  }
  tags = var.tags
}
