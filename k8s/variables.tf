variable "azure-secrets" {
    type = object(
        {
            client-id        = string
            client-secret    = string
            tenant-id        = string
            subscription-id  = string
        }
    )
}
variable "ddns-secrets" {
    type = map(any)
    default = {}
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
variable "k8s-secrets" {
    type = map(any)
    default = {}
}
variable "letsencrypt-secrets" {
    type = map(any)
    default = {}
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
variable "nexus-secrets" {
    type = map(any)
    default = {}
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
variable "secrets" {
    type = object({
        rg-name        = string
        key-vault-name = string
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
