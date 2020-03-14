module "firewall-rules" {
    source = "git@github.com:dgsd-consulting/tf-library.git//gcp/firewall"

    # firewall-values = var.firewall-values
    firewall-values = {
        allow-ports   = var.firewall-values.allow-ports
        deny-ports    = var.firewall-values.deny-ports
        destinations  = []
        firewall-name = var.firewall-values.firewall-name
        network-name  = module.network.network-self-link
    }
}