terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.5.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.serviceprinciple_id
  client_secret   = var.serviceprinciple_key
  tenant_id       = var.tenant_id

  # Required 
  features {} 
}

# aks cluster creation
module "cluster" {
  source                = "./modules/cluster/"
  serviceprinciple_id   = var.serviceprinciple_id
  serviceprinciple_key  = var.serviceprinciple_key
  ssh_key               = var.ssh_key
  location              = var.location
  kubernetes_version    = var.kubernetes_version  
  
}

/* # Data source to reference Azure Key Vault holding secrets
data "azurerm_key_vault" "kv" {
  name                = "terraform-aks-kv"
  resource_group_name = "terraform-aks-rg"
}

# Data Source to get username secret from Azure Key Vault previously defined
data "azurerm_key_vault_secret" "vm_username" {
  name         = "vm-username-default"
  key_vault_id = data.azurerm_key_vault.kv.id
}

# How to access to the secret value:
#   admin_username      = data.azurerm_key_vault_secret.vm_username.value

output "secret_value" {
  value = "${data.azurerm_key_vault_secret.vm_username.value}"
  sensitive = true
} */