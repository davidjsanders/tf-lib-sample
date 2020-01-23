module "k8s-rg" {
  source    = "git@github.com:dgsd-consulting/tf-library.git//azure/lib/resource-group/"
  rg        = {
    rg-name  = format(
      "%s%s",
      var.rg.rg-name,
      local.l-random
    )
    location = var.rg.location
  }
  tags      = var.tags
}
