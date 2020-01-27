resource "null_resource" "jumpbox-provisioner" {
  triggers = {
    jumpbox      = module.k8s-jumpbox.vm-id
    pip          = data.azurerm_public_ip.attached-pip.id
  }

  connection {
    host         = data.azurerm_public_ip.attached-pip.ip_address
    type         = "ssh"
    user         = var.jumpbox.admin-user
    private_key  = file(var.jumpbox.private-key-file)
  }

  provisioner "file" {
    source      = var.jumpbox.private-key-file
    destination = "/home/${var.jumpbox.admin-user}/.ssh/azure-pk"
  }

  provisioner "file" {
    content     = data.template_file.template-ssh-config.rendered
    destination = "/home/${var.jumpbox.admin-user}/.ssh/config"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 0600 ~/.ssh/azure-pk",
      "echo 'Done.'",
    ]
  }

}