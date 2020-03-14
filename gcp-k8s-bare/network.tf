module "network" {
    source = "git@github.com:dgsd-consulting/tf-library.git//gcp/n-tier-network"

    network-info = {
        auto-create-subnets = false
        network-name        = "djs-test"
        subnets = [
            {
                cidr-block  = "10.70.0.0/26",
                region      = var.google-project.region
                subnet-name = "jumpbox-snet"
            },
            {
                cidr-block  = "10.70.1.0/24",
                region      = var.google-project.region
                subnet-name = "master-snet"
            },
            {
                cidr-block  = "10.70.2.0/26",
                region      = var.google-project.region
                subnet-name = "workers-snet"
            }
        ]
    }
}