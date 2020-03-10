module "vm-jumpbox" {
    source = "git@github.com:dgsd-consulting/tf-library.git//gcp/linux-jumpbox"

    datadisk       = var.datadisk
    labels         = var.labels
    server         = var.server-jumpbox
    randoms        = {
        instance-id = random_id.instance-id.hex
        host-id     = random_integer.host-id.result
    }
}