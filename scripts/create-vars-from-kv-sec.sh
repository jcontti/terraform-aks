#!/bin/bash

## Set environment variables from KeyVault secrets.

export SERVICE_PRINCIPAL=$(az keyvault secret show --name service-principal-kv --vault-name terraform-aks-kv --query value -o tsv)

export SERVICE_PRINCIPAL_SECRET=$(az keyvault secret show --name service-principal-secret-kv --vault-name terraform-aks-kv --query value -o tsv)

export SUBSCRIPTION=$(az keyvault secret show --name free-subscription-kv --vault-name terraform-aks-kv --query value -o tsv)

export TENTANT_ID=$(az keyvault secret show --name free-tentant-kv --vault-name terraform-aks-kv --query value -o tsv)

export SSH_KEY=$(az keyvault secret show --name ssh-key-kv --vault-name terraform-aks-kv --query value -o tsv)
