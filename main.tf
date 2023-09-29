provider "azurerm" {
  
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id   
  client_secret   = var.client_secret
  skip_provider_registration = true
  features {}
}


/* create resource group*/
resource "azurerm_resource_group" "trg" {  
   name     = var.resource_group_name
   location = var.resource_location
    tags = {  
        InstanceType =  var.instance_type   
    }  
}

/* create resource group for snet*/
resource "azurerm_resource_group" "tsrg" { 
   count = length(var.resource_vnet_group_name) 
   name     = "${element(var.resource_vnet_group_name, count.index)}"
   location = var.resource_location
    tags = {  
        InstanceType =  var.instance_type   
    }  
}

/* create vnet   */
resource "azurerm_virtual_network" "tvnet" {
  name                =  var.vnet_name
  address_space       = [var.address_space]
  location            = var.resource_location
  resource_group_name = "${azurerm_resource_group.trg.name}"
}

/* create subnet */
/*resource "azurerm_subnet" "tsubnet" {
  count = length(var.subnet_names)
  name     = "${format("${var.globle_prefix}%s",element(var.subnet_names, count.index) )}"
  resource_group_name  = "tf-infra-source-rg" //Existing source resource group name
  virtual_network_name = var.vnet_name // Existing source vnet name
  address_prefixes     = [element(var.subnet_prefixes, count.index)]
}*/

/* create subnet */
resource "azurerm_subnet" "tsubnet" {
  count = length(var.subnet_names)
  name     = "${format("${var.globle_prefix_Dev}%s",element(var.subnet_names, count.index) )}"
  resource_group_name  = "${azurerm_resource_group.trg.name}" 
  virtual_network_name = "${azurerm_virtual_network.tvnet.name}"
  address_prefixes     = [element(var.subnet_prefixes, count.index)]
}




