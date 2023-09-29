variable "subscription_id" {
  type = string
  default = "ac842354-88cd-484a-926c-2d6badf90dba"
  description = "The id of the resource group in which the resources will be created"
}
variable tenant_id{
  type = string
  default ="de5a6970-d24c-4eb0-a6d1-a8942d27c2e0"
  description = "The tenant id of the application registration to be used"    
}
variable client_id{
  type = string
  default = "7bcb8f56-69de-419d-bdf6-96b04f5d4563"
  description = "The client id of the application registration to be used"    
}

variable client_secret{
  type = string
  default = "1Cd8Q~GfMm0G_iRihsUqF1~dCQ7hfEjrnOnsidyR"
  description = "The client secret of the application registration to be used"    
}

variable instance_type {
    type = string
    default = "DEV-TERRAFORM-Desti" 
    description = "Instance Type Tag Value"
}

variable resource_location {
  type    = string
  default = "central us"
  description = "Resource Azure Location value"
}

/*variable resource_group_name{
  type = string
  default = 
  description = "The name of resource group required to be provisioned"
}*/

variable resource_group_name{
  type = string
  default = "tf-infra-desti-rg"
  description = "The name of resource group required to be provisioned"
}
variable resource_vnet_group_name{
  type = list
  default = ["tf-app-desti-rg","tf-db-desti-rg"]
  description = "The name of resource group required to be provisioned"
}

variable globle_prefix_Dev {
  default = "Az-Project-DEV-US"
}

variable vnet_name {
  type    = string
  default = "Az-Project-INFRA-US-vNet"
  description = "Name of the vnet to create"
}

variable address_space  {
  type    = string
  default = "10.2.0.0/16"
  description = "The address space that is used by the virtual network."
}



variable subnet_names {
  type    = list
  default = ["-Desti-App-sNet","-Desti-DB-sNet"]
  description = "Resource Azure Subnet names"
}

variable subnet_prefixes{
    type = list
    default = ["10.2.3.0/24","10.2.4.0/24"]
    description = "The address prefix to use for the subnet."
}
variable vm_names{
    type = list
    default = ["AZPRPROJWSAPP01","AZPRPROJWSDBS01"]
    description = "The VM names."
}


