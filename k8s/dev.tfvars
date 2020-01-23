jumpbox              = {
    admin-user      = "azadmin"
    image-name      = "K8S-UBUNTU-1804-20-01-14"
    image-rg        = "RG-ENGINEERING"
    machine-size    = "Standard_DS1_v2"
    public-key-file = "~/.ssh/azure-pk.pub"
}
master-data-disk = {
    disk-name    = "k8s-temp-data-disk"
    rg-name      = "K8S-PERSISTENT"
}
network = {
    address-space   = ["192.168.0.0/23"]
    subnet-names    = [
      "masters",
      "workers",
      "jumpboxes"
    ]
    subnet-prefixes = [
      "192.168.0.0/26",
      "192.168.1.0/24",
      "192.168.0.64/27"
    ]
}
resources = {
    name-prefix = "k8s-lib"
    sa-name   = "dasanderk8slib"
    randomized = true
}
rg = {
    rg-name    = "k8s-bare"
    location   = "East US"
}
tags                 = {
    billing-code   = "LIB00-01"
    business-group = "Library Development"
    description    = "Library Development - k8s module"
    environment    = "dev"
    target         = "EUS"
}
