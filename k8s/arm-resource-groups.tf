module "k8s-rg" {
  source    = "git@github.com:dgsd-consulting/tf-library.git//azure/lib/resource-group/"
  rg        = {
    randomizer = local.l-random
    rg-name    = var.rg.rg-name
    location   = var.rg.location
  }
  tags      = var.tags
}
