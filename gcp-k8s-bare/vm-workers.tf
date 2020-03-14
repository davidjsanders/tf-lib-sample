module "vm-workers" {
    source = "git@github.com:dgsd-consulting/tf-library.git//gcp/linux-server"

    labels         = var.labels
    server         = {
        admin-user   = var.server-workers.admin-user
        delete-osd   = var.server-workers.delete-osd
        image-id     = var.server-workers.image-id
        keyfile      = var.server-workers.keyfile
        machine-type = var.server-workers.machine-type
        network      = module.network.network-self-link
        pub-keyfile  = var.server-workers.pub-keyfile
        public-ip    = var.server-workers.public-ip
        script       = var.server-workers.script
        subnetwork   = module.network.subnet-self-links[2]
        vm-count     = var.server-workers.vm-count
        vm-hostname  = var.server-workers.vm-hostname
        vm-prefix    = var.server-workers.vm-prefix
        zone         = var.server-workers.zone
    }

    # server         = var.server-workers
    randoms        = {
        instance-id = random_integer.host-id.result
        host-id     = random_integer.host-id.result
    }
}