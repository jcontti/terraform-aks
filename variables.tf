/* We are going to pass the values in this way:

    terraform plan -var serviceprinciple_id=$SERVICE_PRINCIPAL \
        -var serviceprinciple_key="$SERVICE_PRINCIPAL_SECRET" \
        -var tenant_id=$TENTANT_ID \
        -var subscription_id=$SUBSCRIPTION \
        -var ssh_key="$SSH_KEY" 

*/

variable "serviceprinciple_id" {
}

variable "serviceprinciple_key" {
}

variable "tenant_id" {
}

variable "subscription_id" {
}


variable "ssh_key" {
}

variable "location" {
  default = "Central US"
}

variable "kubernetes_version" {
    default = "1.19.3"
}