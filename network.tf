resource "azurerm_resource_group" "example" {
  name     = "my-resources"
  location = var.location
}
module "network" {
  source  = "app.terraform.io/juan_org/network-1/azurerm"
  version = "3.5.0"
  resource_group_name = azurerm_resource_group.myresourcegroup.name
  address_spaces      = ["10.0.0.0/16", "10.2.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  subnet_names        = ["subnet1", "subnet2", "subnet3"]
  
    depends_on = [azurerm_resource_group.myresourcegroup]
}
