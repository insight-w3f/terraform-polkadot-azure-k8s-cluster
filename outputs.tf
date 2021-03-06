data "azurerm_resources" "scale_set" {
  resource_group_name = azurerm_kubernetes_cluster.this.node_resource_group
  type                = "Microsoft.Compute/virtualMachineScaleSets"
}

output "id" {
  description = "A unique ID that can be used to identify and reference a Kubernetes cluster"
  value       = azurerm_kubernetes_cluster.this.id
}

output "endpoint" {
  description = "The base URL of the API server on the Kubernetes master node"
  value       = azurerm_kubernetes_cluster.this.kube_config.0.host
}

output "kube_config" {
  description = "The full contents of the Kubernetes cluster's kubeconfig file"
  value       = azurerm_kubernetes_cluster.this.kube_config_raw
}

output "cluster_ca_cert" {
  description = "The base64 encoded public certificate for the cluster's certificate authority"
  value       = azurerm_kubernetes_cluster.this.kube_config.0.cluster_ca_certificate
}

output "cluster_client_key" {
  description = "The base64 encoded private key used by clients to access the cluster"
  value       = azurerm_kubernetes_cluster.this.kube_config.0.client_key
}

output "cluster_client_certificate" {
  description = "The base64 encoded public certificate used by clients to access the cluster"
  value       = azurerm_kubernetes_cluster.this.kube_config.0.client_certificate
}

output "username" {
  description = "The cluster username"
  value       = azurerm_kubernetes_cluster.this.kube_config.0.username
}

output "password" {
  description = "The cluster password"
  value       = azurerm_kubernetes_cluster.this.kube_config.0.password
}

output "resource_group" {
  description = "Name of the resource group where cluster resources are"
  value       = azurerm_kubernetes_cluster.this.node_resource_group
}

output "scale_set" {
  value = join(",", data.azurerm_resources.scale_set.resources.*.name)
}