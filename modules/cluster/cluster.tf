resource "azurerm_resource_group" "aks-getting-started" {
  name     = "aks-getting-started"
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks-getting-started" {
  name                  = "aks-getting-started"
  location              = azurerm_resource_group.aks-getting-started.location
  resource_group_name   = azurerm_resource_group.aks-getting-started.name
  dns_prefix            = "aks-getting-started"            
  kubernetes_version    =  var.kubernetes_version
  
  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
    type       = "VirtualMachineScaleSets"
    os_disk_size_gb = 50
  }

  service_principal  {
    client_id = var.serviceprinciple_id
    client_secret = var.serviceprinciple_key
  }

  # create a user
  linux_profile {
    admin_username = "azureuser"
    ssh_key {
        key_data = var.ssh_key
    }
  }

  # If network_profile is not defined, kubenet profile will be used by default.
  network_profile {
      network_plugin = "kubenet"
      load_balancer_sku = "Standard"
  }

  # Disable unnecessary addons
  addon_profile {
    aci_connector_linux {
      enabled = false
    }

    azure_policy {
      enabled = false
    }

    http_application_routing {
      enabled = false
    }

    kube_dashboard {
      enabled = false
    }

    #  The Log Analytics agent
    oms_agent {
      enabled = false
    }
  }

}