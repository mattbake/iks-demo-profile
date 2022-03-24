#Wait for cluster to come up and then outpt the kubeconfig, if successful
output "kube_config" {
	value = intersight_kubernetes_cluster_profile.kubeprofaction.kube_config[0].kube_config
}

output "organization_moid" {
  value = data.intersight_organization_organization.organization_moid.results.0.moid
}