module "vm-master" {
    source = "git@github.com:dgsd-consulting/tf-library.git//gcp/linux-server"

    datadisk       = var.datadisk
    labels         = var.labels
    server         = var.server-master
    randoms        = {
        instance-id = random_id.instance-id.hex
        host-id     = random_integer.host-id.result
    }
}