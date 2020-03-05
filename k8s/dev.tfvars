jumpbox = {
    admin-user       = "azadmin"
    image-name       = "K8S-UBUNTU-ANSIBLE-20-02-24.2"
    image-rg         = "RG-ENGINEERING"
    machine-size     = "Standard_DS1_v2"
    private-key-file = "~/.ssh/azure-pk"
    public-key-file  = "~/.ssh/azure-pk.pub"
}

kubernetes = {
    api             = "kubeadm.k8s.io"
    api-version     = "v1beta1"
    cert-dir        = "/etc/kubernetes/pki"
    cluster-name    = "kubernetes"
    helm-account    = "tiller"
    kubeadm-version = "1.17.1"
    pod-subnet      = "192.168.0.0/16"
    service-subnet  = "10.96.0.0/12"
    version         = "1.17.1-00"
}

masters = {
    admin-user       = "azadmin"
    image-name       = "K8S-UBUNTU-ANSIBLE-20-02-24.2"
    image-rg         = "RG-ENGINEERING"
    machine-size     = "Standard_DS2_v2"
    no-of-masters    = 1
    private-key-file = "~/.ssh/azure-pk"
    public-key-file  = "~/.ssh/azure-pk.pub"
}

master-data-disk = {
    disk-name    = "k8s-temp-data-disk"
    rg-name      = "K8S-PERSISTENT"
}

network = {
    address-space   = ["10.70.0.0/20"]
    subnet-names    = [
      "masters",
      "workers",
      "jumpboxes"
    ]
    subnet-prefixes = [
      "10.70.0.0/26",
      "10.70.1.0/24",
      "10.70.2.0/27"
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

workers = {
    admin-user       = "azadmin"
    image-name       = "K8S-UBUNTU-ANSIBLE-20-02-24.2"
    image-rg         = "RG-ENGINEERING"
    machine-size     = "Standard_DS3_v2"
    no-of-workers    = 3
    private-key-file = "~/.ssh/azure-pk"
    public-key-file  = "~/.ssh/azure-pk.pub"
}
