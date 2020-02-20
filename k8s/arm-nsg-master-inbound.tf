resource "azurerm_network_security_rule" "master-deny-all" {
  access                      = "Deny"
  direction                   = "Inbound"
  destination_address_prefix  = "*"
  destination_port_range      = "*"
  name                        = "deny-all-traffic"
  priority                    = 4096
  protocol                    = "*"
  source_port_range           = "*"
  source_address_prefix       = "*"
  resource_group_name         = azurerm_resource_group.k8s-rg.name
  network_security_group_name = azurerm_network_security_group.k8s-nsg-masters.name
}

resource "azurerm_network_security_rule" "master-allow-ssh" {
  access                      = "Allow"
  direction                   = "Inbound"
  destination_address_prefix  = "*"
  destination_port_range      = "22"
  name                        = "allow-ssh"
  priority                    = 100
  protocol                    = "Tcp"
  source_port_range           = "*"
  source_address_prefix       = var.network.address-space[0]
  resource_group_name         = azurerm_resource_group.k8s-rg.name
  network_security_group_name = azurerm_network_security_group.k8s-nsg-masters.name
}

resource "azurerm_network_security_rule" "master-allow-6443" {
  access                      = "Allow"
  direction                   = "Inbound"
  destination_address_prefix  = "*"
  destination_port_range      = "6443"
  name                        = "allow-6443"
  priority                    = 110
  protocol                    = "Tcp"
  source_port_range           = "*"
  source_address_prefixes     = [var.network.subnet-prefixes[0], var.network.subnet-prefixes[1]]
  resource_group_name         = azurerm_resource_group.k8s-rg.name
  network_security_group_name = azurerm_network_security_group.k8s-nsg-masters.name
}

resource "azurerm_network_security_rule" "master-allow-2379-2380" {
  access                      = "Allow"
  direction                   = "Inbound"
  destination_address_prefix  = "*"
  destination_port_ranges     = ["2379", "2380"]
  name                        = "allow-2379-2380"
  priority                    = 120
  protocol                    = "Tcp"
  source_port_range           = "*"
  source_address_prefixes     = [var.network.subnet-prefixes[0], var.network.subnet-prefixes[1]]
  resource_group_name         = azurerm_resource_group.k8s-rg.name
  network_security_group_name = azurerm_network_security_group.k8s-nsg-masters.name
}

resource "azurerm_network_security_rule" "master-allow-10250-10251-10252" {
  access                      = "Allow"
  direction                   = "Inbound"
  destination_address_prefix  = "*"
  destination_port_ranges     = ["10250", "10251", "10252"]
  name                        = "allow-10250-10251-10252"
  priority                    = 130
  protocol                    = "Tcp"
  source_port_range           = "*"
  source_address_prefixes     = [var.network.subnet-prefixes[0], var.network.subnet-prefixes[1]]
  resource_group_name         = azurerm_resource_group.k8s-rg.name
  network_security_group_name = azurerm_network_security_group.k8s-nsg-masters.name
}

