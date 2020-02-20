variable "azure-secrets" {
    type = object(
        {
            client-id         = string
            client-secret     = string
            tenant-id         = string
            subscription-id   = string
            key-vault-rg-name = string
            key-vault-name    = string
        }
    )
}
variable "jumpbox" {
  type = object(
      {
          admin-user       = string
          image-name       = string
          image-rg         = string
          machine-size     = string
          private-key-file = string
          public-key-file  = string
      }
  )
}
variable "kubernetes" {
    type = object({
        api             = string
        api-version     = string
        cert-dir        = string
        cluster-name    = string
        helm-account    = string
        kubeadm-version = string
        pod-subnet      = string
        service-subnet  = string
        version         = string
    })
}
variable "masters" {
  type = object(
      {
          admin-user       = string
          image-name       = string
          image-rg         = string
          machine-size     = string
          no-of-masters    = number
          private-key-file = string
          public-key-file  = string
      }
  )
}
variable "master-data-disk" {
    type = object({
        disk-name = string
        rg-name   = string
    })
}
variable "network" {
    type = object({
        address-space   = list(string)
        subnet-names    = list(string)
        subnet-prefixes = list(string)
    })
}
variable "resources" {
    type = object({
        name-prefix = string
        sa-name   = string
        randomized  = bool
    })
}
variable "rg" {
    type = object({
        rg-name    = string
        location   = string
    })
}
variable "tags" {
  type = object({})
}
variable "workers" {
  type = object(
      {
          admin-user       = string
          image-name       = string
          image-rg         = string
          machine-size     = string
          no-of-workers    = number
          private-key-file = string
          public-key-file  = string
      }
  )
}
