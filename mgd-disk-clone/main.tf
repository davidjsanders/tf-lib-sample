module "clone-disk" {
    source = "git@github.com:dgsd-consulting/tf-library.git//azure/clone-managed-disk"
    destination-disk = var.destination-disk
    randomizer       = var.randomizer
    source-disk      = var.source-disk
    tags             = var.tags
}