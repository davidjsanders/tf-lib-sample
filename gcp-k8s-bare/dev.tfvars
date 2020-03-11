datadisk = [
    {
        block_size_bytes = 4096
        disk-name        = "opt"
        disk-size-in-gb  = 40
        disk-type        = "pd-ssd"
        mountpoint       = "/opt"
        zone             = "us-east1-b"
    },
    {
        block_size_bytes = 4096
        disk-name        = "datadisk"
        disk-size-in-gb  = 100
        disk-type        = "pd-ssd"
        mountpoint       = "/datadrive"
        zone             = "us-east1-b"
    }
]
firewall-values = {
    allow-ports   = [
        { port=5000, protocol = "tcp" }
    ]
    deny-ports    = []
    firewall-name = "flask-firewall"
    network-name  = "default"
}
google-project = {
    project-id = "tf-library-samples"
    region     = "us-east1"
}
labels = {
    billing-code   = "ab12345"
    business-group = "technology"
    environment    = "dev"
    geography      = "us"
}
server-jumpbox = {
    admin-user   = "gcpadmin"
    delete-osd   = true
    keyfile      = "~/.ssh/gcp-admin"
    machine-type = "f1-micro"
    pub-keyfile  = "~/.ssh/gcp-admin.pub"
    script       = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask"
    vm-hostname  = ""
    vm-prefix    = "jumpbox"
    zone         = "us-east1-b"
}
server-master = {
    admin-user   = "gcpadmin"
    delete-osd   = true
    keyfile      = "~/.ssh/gcp-admin"
    machine-type = "f1-micro"
    pub-keyfile  = "~/.ssh/gcp-admin.pub"
    public-ip    = false
    script       = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask"
    vm-count     = 3
    vm-hostname  = ""
    vm-prefix    = "master"
    zone         = "us-east1-b"
}
    # vm-hostname  = "ubuvm.dgsd-consulting.com"
