variable "resource_group_location" {
  default     = "centralus"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  default     = "dev-hdfc-demo-rg"
  description = "Name of the resource group."
}

variable "virtual_network_name"{
  default = "rg-hdfc-vnet"
  description = "Virtual Network Name"
}


