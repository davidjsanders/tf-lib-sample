variable "datadisk" {
    type = list(object({
        block_size_bytes = number
        disk-name        = string
        disk-size-in-gb  = number
        disk-type        = string
        mountpoint       = string
        zone             = string
    }))
}
variable "firewall-values" {
    type = object({
        allow-ports   = list(object({
            port     = number
            protocol = string
        }))
        deny-ports   = list(object({
            port     = number
            protocol = string
        }))
        firewall-name = string
        network-name  = string
    })
}
variable "google-project" {
    type = object({
        project-id = string
        region     = string
    })
}
variable "google-secrets" {
    type = object({
        credentials-filename = string
        credentials-path     = string
    })
}
variable "labels" {
    type = map(string)
}
variable "server-jumpbox" {
    type = object({
        admin-user   = string
        delete-osd   = bool
        image-id     = string
        keyfile      = string
        machine-type = string
        network      = string
        pub-keyfile  = string
        script       = string
        subnetwork   = string
        vm-hostname  = string
        vm-prefix    = string
        zone         = string
    })
}
variable "server-master" {
    type = object({
        admin-user   = string
        delete-osd   = bool
        image-id     = string
        keyfile      = string
        machine-type = string
        network      = string
        pub-keyfile  = string
        public-ip    = bool
        script       = string
        subnetwork   = string
        vm-count     = number
        vm-hostname  = string
        vm-prefix    = string
        zone         = string
    })
}
variable "server-workers" {
    type = object({
        admin-user   = string
        delete-osd   = bool
        image-id     = string
        keyfile      = string
        machine-type = string
        network      = string
        pub-keyfile  = string
        public-ip    = bool
        script       = string
        subnetwork   = string
        vm-count     = number
        vm-hostname  = string
        vm-prefix    = string
        zone         = string
    })
}