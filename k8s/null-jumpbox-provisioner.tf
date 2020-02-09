resource "null_resource" "jumpbox-provisioner" {
  triggers = {
    masters = join(",", module.vm-masters.vm-ids)
    jumpbox = join(",", module.vm-jumpbox.vm-id)
    workers = join(",", module.vm-workers.vm-ids)
  }

  connection {
    host         = module.vm-jumpbox.public-ip
    # bastion_host = azurerm_public_ip.k8s-pip-jump.*.ip_address[0]
    type         = "ssh"
    user         = var.jumpbox.admin-user
    private_key  = file(var.jumpbox.private-key-file)
  }

  provisioner "file" {
    content = templatefile(
        "templates/ssh-config.tmpl",
        {
            hosts = flatten([
                [for i in range(0, var.workers.no-of-workers) : {
                    "name": module.vm-workers.hostnames[i]
                    "ip"  : module.vm-workers.nic-private-ips[i]
                }],
                [for i in range(0, var.masters.no-of-masters) : {
                    "name": module.vm-masters.hostnames[i]
                    "ip"  : module.vm-masters.nic-private-ips[i]
                }],
                {
                    "name": module.vm-jumpbox.hostname[0]
                    "ip"  : module.vm-jumpbox.nic-private-ip[0]
                }
            ])
        }
    )
    destination = format(
        "/home/%s/.ssh/config",
        var.jumpbox.admin-user
    )
  }

  provisioner "file" {
    content     = templatefile(
        "templates/inventory.tmpl",
        {
            admin                        = var.jumpbox.admin-user
            ansible_ssh_private_key_file = format(
                "/home/%s/.ssh/id_rsa",
                var.jumpbox.admin-user
            )
            auth_file                    = ""
            domain                       = ""
            email                        = ""
            helm_service_account_name    = "helmer"
            jumpboxes                    = {
                "jumpbox-name": module.vm-jumpbox.vm-name[0]
                "jumpbox-ip"  : module.vm-jumpbox.nic-private-ip[0]
            }
            kubeadm                      = {
                api              = ""
                api_version      = ""
                api_advertise_ip = ""
                cert_dir         = ""
                cluster_name     = ""
                pod_subnet       = ""
                service_subnet   = ""
                version          = ""
            }
            master                       = {
                "master-name": module.vm-masters.vm-names[0]
                "master-ip"  : module.vm-workers.nic-private-ips[0]
            }
            masters                      = [
                for i in range(0, var.masters.no-of-masters) : {
                    "master-name": module.vm-masters.vm-names[i]
                    "master-ip"  : module.vm-masters.nic-private-ips[i]
                }
            ]
            nexus                        = {
                password = ""
                username = ""
            }
            os_k8s_version               = ""
            postgres                     = {
                db       = ""
                endpoint = ""
                password = ""
                port     = 5432
                user     = ""
            }
            prod_staging_flag            = "dev"
            registry                     = ""
            workers                      = [
                for i in range(0, var.workers.no-of-workers) : {
                    "worker-name": module.vm-workers.vm-names[i]
                    "worker-ip"  : module.vm-workers.nic-private-ips[i]
                }
            ]
        }
    )
    destination = format(
        "/home/%s/inventory.txt",
        var.jumpbox.admin-user
    )
  }
}