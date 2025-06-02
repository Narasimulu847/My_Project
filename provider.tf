terraform {
    required_providers {
        azurerm = {        
            source = "hashicorp/azurerm"
            version = ">=4.14.0"    #"4.29.0"  #
        }
    }
}

provider "azurerm" {
features {}
subscription_id = "b88e242c-ef56-4c77-b9b4-8dc2a3c461be"
}
