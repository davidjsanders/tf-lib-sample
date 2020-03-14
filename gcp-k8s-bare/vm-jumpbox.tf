module "vm-jumpbox" {
    source = "git@github.com:dgsd-consulting/tf-library.git//gcp/linux-jumpbox"

    labels         = var.labels
    # server         = var.server-jumpbox-jumpbox
    server         = {
        admin-user   = var.server-jumpbox.admin-user
        delete-osd   = var.server-jumpbox.delete-osd
        image-id     = var.server-jumpbox.image-id
        keyfile      = var.server-jumpbox.keyfile
        machine-type = var.server-jumpbox.machine-type
        network      = module.network.network-self-link
        pub-keyfile  = var.server-jumpbox.pub-keyfile
        script       = var.server-jumpbox.script
        subnetwork   = module.network.subnet-self-links[0]
        vm-hostname  = var.server-jumpbox.vm-hostname
        vm-prefix    = var.server-jumpbox.vm-prefix
        zone         = var.server-jumpbox.zone
    }
    randoms        = {
        instance-id = random_integer.host-id.result
        host-id     = random_integer.host-id.result
    }
}