destination-disk = {
    disk-name            = "TEST-CLONE-DISK"
    encryption-settings  = {}
    location             = "East US"
    rg-name              = "K8S-PERSISTENT"
    storage-account-type = "Premium_LRS"
}
randomizer = ""
source-disk = {
    disk-name = "k8s-temp-data-disk"
    rg-name   = "K8S-PERSISTENT"
}
tags = {
    billing-code   = "LIB00-01"
    business-group = "Library Development"
    description    = "Library Development - k8s module"
    environment    = "dev"
    target         = "EUS"
}