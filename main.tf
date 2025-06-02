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

resource "azurerm_app_service" "appsrv01"{
  name = "hdfc-corp-appln"
  resource_group_name = var.resource_group_name
  location = var.resource_group_location
  app_service_plan_id =  azurerm_app_service_plan.appserplan01.id
}

resource "azurerm_storage_account" "stoacct010"{
  name = "hdfcstorageacct"
  resource_group_name = var.resource_group_name
  location = var.resource_group_location
  account_tier = "Standard"
  account_replication_type = "ZRS"
}

resource "azurerm_private_endpoint" "pvtendpt01" {
  name = "hdfc-appln-srvc-pvt-endpoint"
  resource_group_name = var.resource_group_name
  location = var.resource_group_location
  subnet_id = azurerm_subnet.subnet01.id

  private_service_connection {
    name = "hdfc-pvt-service-conn"
    private_connection_resource_id = azurerm_storage_account.stoacct010.id
    is_manual_connection = false
    subresource_names = [ "blob" ]
  }
}
