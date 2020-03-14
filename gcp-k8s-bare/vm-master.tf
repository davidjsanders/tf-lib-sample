module "vm-master" {
    source = "git@github.com:dgsd-consulting/tf-library.git//gcp/linux-server"

    labels         = var.labels
    server         = {
        admin-user   = var.server-master.admin-user
        delete-osd   = var.server-master.delete-osd
        image-id     = var.server-master.image-id
        keyfile      = var.server-master.keyfile
        machine-type = var.server-master.machine-type
        network      = module.network.network-self-link
        pub-keyfile  = var.server-master.pub-keyfile
        public-ip    = var.server-master.public-ip
        script       = var.server-master.script
        subnetwork   = module.network.subnet-self-links[1]
        vm-count     = var.server-master.vm-count
        vm-hostname  = var.server-master.vm-hostname
        vm-prefix    = var.server-master.vm-prefix
        zone         = var.server-master.zone
    }

    # server         = var.server-master
    randoms        = {
        instance-id = random_integer.host-id.result
        host-id     = random_integer.host-id.result
    }
}