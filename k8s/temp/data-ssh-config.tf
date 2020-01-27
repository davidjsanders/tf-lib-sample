data "template_file" "template-ssh-config" {
  template = file("file-ssh-config.txt")

  vars = {
      hosts = join(
          " ",
          concat(
            list(module.k8s-jumpbox.vm-name),
            module.srv-master.vm-names,
            module.srv-worker-1.vm-names,
            module.srv-worker-2.vm-names,
            module.srv-worker-3.vm-names
          )
      )
  }
}

