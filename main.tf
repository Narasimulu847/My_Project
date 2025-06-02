resource "azurerm_resource_group" "rg01" {
  location = var.resource_group_location
  name     = "dev-hdfc-demo-rg"
}


resource "azurerm_virtual_network" "vnet01" {
  name = "rg-hdfc-vnet"
  resource_group_name = var.resource_group_name
  location = var.resource_group_location
  address_space = [ "10.0.0.0/22" ]

}

resource "azurerm_subnet" "subnet01"{
  name  = "hdfc-subnet-010"
  resource_group_name = var.resource_group_name
  virtual_network_name  = var.virtual_network_name
  address_prefixes = ["10.0.0.0/24"]

}

resource "azurerm_app_service_plan" "appserplan01"{
  name = "appservice_paln_01"
  resource_group_name = var.resource_group_name
  location = var.resource_group_location

  sku {
    size = "S1" 
    tier = "Standard"
  }

}
