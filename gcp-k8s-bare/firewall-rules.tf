module "firewall-rules" {
    source = "git@github.com:dgsd-consulting/tf-library.git//gcp/firewall"

    firewall-values = var.firewall-values
}