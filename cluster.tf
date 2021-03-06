
# organization moids
data "intersight_organization_organization" "organization_moid" {
  name = var.organization
}

# IPPool moids
data "intersight_ippool_pool" "ippool_moid" {
  name = var.ippool_list
}

# Netcfg moids
data "intersight_kubernetes_network_policy" "netcfg_moid" {
  name = var.net_config
}

# Sysconfig moids
data "intersight_kubernetes_sys_config_policy" "syscfg_moid" {
  name = var.sys_config
}

# kube cluster profiles
resource "intersight_kubernetes_cluster_profile" "kubeprof" {
  name                = var.clustername
  wait_for_completion = false
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.organization_moid.results.0.moid
  }
  cluster_ip_pools {
    object_type = "ippool.Pool"
    moid        = data.intersight_ippool_pool.ippool_moid.results.0.moid
  }
  management_config {
    #encrypted_etcd = local.mgmtcfgetcd
    load_balancer_count = var.mgmtcfglbcnt
    ssh_keys = [
      var.mgmtcfgsshkeys
    ]
    ssh_user    = var.mgmtcfgsshuser
    object_type = "kubernetes.ClusterManagementConfig"
  }
  net_config {
    moid        = data.intersight_kubernetes_network_policy.netcfg_moid.results.0.moid
    object_type = "kubernetes.NetworkPolicy"
  }
  sys_config {
    moid        = data.intersight_kubernetes_sys_config_policy.syscfg_moid.results.0.moid
    object_type = "kubernetes.SysConfigPolicy"
  }
}


# IpPool moids
data "intersight_ippool_pool" "ippoolmaster_moid" {
  name = var.ippoolmaster_list
}

# IpPool moids
data "intersight_ippool_pool" "ippoolworker_moid" {
  name = var.ippoolworker_list
}

# Kube version moids
data "intersight_kubernetes_version_policy" "kubever_moid" {
  name = var.kubever_list
}

# Infra Config Policy
data "intersight_kubernetes_virtual_machine_infra_config_policy" "infrapol" {
  name = var.infrapolname
}

# Instance Type
data "intersight_kubernetes_virtual_machine_instance_type" "instancetype" {
  name = var.instancetypename
}

# Master
resource "intersight_kubernetes_node_group_profile" "masternodegrp" {
  name        = var.mastergrpname
  node_type   = "ControlPlaneWorker"
  desiredsize = var.masterdesiredsize
  maxsize     = var.mastermaxsize
  minsize = var.masterminsize

  ip_pools {
    object_type = "ippool.Pool"
    moid        = data.intersight_ippool_pool.ippoolmaster_moid.results.0.moid
  }


  cluster_profile {
    object_type = "kubernetes.ClusterProfile"
    moid        = intersight_kubernetes_cluster_profile.kubeprof.moid
  }


  kubernetes_version {
    object_type = "kubernetes.VersionPolicy"
    moid        = data.intersight_kubernetes_version_policy.kubever_moid.results.0.moid
  }

}

#Infra provider
resource "intersight_kubernetes_virtual_machine_infrastructure_provider" "masterinfraprov" {
  name = "blahdiblah" #var.masterinfraname
  infra_config_policy {
    moid        = data.intersight_kubernetes_virtual_machine_infra_config_policy.infrapol.results.0.moid
    object_type = "kubernetes.VirtualMachineInfraConfigPolicy"
  }
  instance_type {
    moid        = data.intersight_kubernetes_virtual_machine_instance_type.instancetype.results.0.moid
    object_type = "kubernetes.VirtualMachineInstanceType"
  }
  node_group {
    moid        = intersight_kubernetes_node_group_profile.masternodegrp.moid
    object_type = "kubernetes.NodeGroupProfile"
  }

}


resource "intersight_kubernetes_cluster_profile" "kubeprofaction" {
  depends_on = [
    intersight_kubernetes_node_group_profile.masternodegrp
  ]
  action = "Deploy"
  name   = intersight_kubernetes_cluster_profile.kubeprof.name
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.organization_moid.results.0.moid
  }

}
