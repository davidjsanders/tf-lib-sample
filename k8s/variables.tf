variable "azure-secrets" {
    type = object(
        {
            client-id       = string
            client-secret   = string
            tenant-id       = string
            subscription-id = string
            public-key      = string
        }
    )
}
variable "jumpbox" {
  type = object(
      {
          admin-user      = string
          image-name      = string
          image-rg        = string
          machine-size    = string
          public-key-file = string
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
        sa-prefix   = string
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
