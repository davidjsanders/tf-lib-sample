resource "null_resource" "jumpbox-provisioner" {
    triggers = {
        disk-devices   = join(
            ",",
            google_compute_attached_disk.datadisk-attach.*.device_name
        )
        firewall       = module.vm-master.self-link[0]
        master-names   = join(",", module.vm-master.osname)
        master-ip      = join(",", module.vm-master.private-ip)
        nic-ip-address = module.vm-jumpbox.ip[0]
        vm-id          = module.vm-master.self-link[0]
        vm-keyfile     = file(var.server-jumpbox.keyfile)
        vm-user        = var.server-jumpbox.admin-user
        workers-names  = join(",", module.vm-workers.osname)
        workers-ip     = join(",", module.vm-workers.private-ip)
    }

    connection {
        host        = self.triggers.nic-ip-address
        type        = "ssh"
        user        = self.triggers.vm-user
        private_key = self.triggers.vm-keyfile
    }

    provisioner "file" {
        content = templatefile(
            "${path.module}/templates/inventory.yml",
            {
                admin-user       = var.server-jumpbox.admin-user
                jumpbox-hostname = module.vm-jumpbox.osname[0]
                jumpbox-ip       = module.vm-jumpbox.ip[0]
                masters          = [
                    for i in range(0, var.server-master.vm-count) : {
                        master-name = split(",", self.triggers.master-names)[i]
                        master-host = split(",", self.triggers.master-ip)[i]
                    }
                ]
                master-subnet    = "10.70.1.0/24"
                workers          = [
                    for i in range(0, var.server-workers.vm-count) : {
                        worker-name = split(",", self.triggers.workers-names)[i]
                        worker-host = split(",", self.triggers.workers-ip)[i]
                    }
                ]
                worker-subnet    = "10.70.2.0/26"
            }
        )
        destination = "~/inventory.yml"
    }

    provisioner "file" {
        source = var.server-jumpbox.keyfile
        destination = "~/.ssh/id_rsa"
    }

    provisioner "file" {
        source = "${path.module}/templates/bootstrap-jumpbox.sh"
        destination = "~/bootstrap-jumpbox.sh"
    }

    provisioner "remote-exec" {
        inline = [<<EOF
chmod +x ~/bootstrap-jumpbox.sh
chmod 0600 ~/.ssh/id_rsa
sudo ~/bootstrap-jumpbox.sh
ansible-playbook \
    -i inventory.yml \
    ansible-playbooks/squid-proxy/playbook.yml
echo "Done.",
EOF
        ]
    }
}