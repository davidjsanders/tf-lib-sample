module "k8s-load-balancer" {
#    source = "git@github.com:dgsd-consulting/tf-library.git//azure/k8s-load-balancer?ref=0.3"
    source = "git@github.com:dgsd-consulting/tf-library.git//azure/k8s-load-balancer"
    load-balancer = {
        be-name       = "k8s-backend"
        fe-name       = "k8s-frontend"
        http-be-port  = 30888
        http-fe-port  = 80
        https-be-port = 30443
        https-fe-port = 443
        lb-name       = "k8s-lb"
        location      = azurerm_resource_group.k8s-rg.location
        nics          = module.vm-workers.nic-ids
        pip-id        = azurerm_public_ip.lb-pip.id
        rg-name       = azurerm_resource_group.k8s-rg.name
        sku           = "Basic"
    }
    tags         = var.tags
}