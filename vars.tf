
/* #get the data from the global vars WS
data "terraform_remote_state" "global" {
  backend = "remote"
  config = {
    organization = "cloudsoftwareteam-tfc"
    workspaces = {
      name = var.globalwsname
    }
  }
} */

#variable definitions
variable "api_key" {
  type        = string
  description = "API Key"
}
variable "secretkey" {
  type        = string
  description = "Secret Key"
}
/* variable "globalwsname" {
  type        = string
  description = "TFC WS from where to get the params"
} */
variable "mgmtcfgsshkeys" {
  type        = string
  description = "sshkeys"
}
variable "organization" {
  type = string
}
variable "ippool_list" {
  type = string
}
variable "net_config" {
  type = string
}
variable "sys_config" {
  type = string
}
variable "clustername" {
  type = string
}
variable "mgmtcfglbcnt" {
  type = string
}
variable "mgmtcfgsshuser" {
  type = string
}
variable "ippoolmaster_list" {
  type = string
}
variable "ippoolworker_list" {
  type = string
}
variable "kubever_list" {
  type = string
}
variable "infrapolname" {
  type = string
}
variable "instancetypename" {
  type = string
}
variable "mastergrpname" {
  type = string
}
variable "masterdesiredsize" {
  type = string
}
variable "masterinfraname" {
  type = string
}



#locals {
# organization= yamldecode(data.terraform_remote_state.global.outputs.organization)
# ippool_list = yamldecode(data.terraform_remote_state.global.outputs.ip_pool_policy)
# netcfg_list = yamldecode(data.terraform_remote_state.global.outputs.network_pod)
# syscfg_list = yamldecode(data.terraform_remote_state.global.outputs.network_service)
# clustername = yamldecode(data.terraform_remote_state.global.outputs.clustername)
#mgmtcfgetcd = yamldecode(data.terraform_remote_state.global.outputs.mgmtcfgetcd)
# mgmtcfglbcnt = yamldecode(data.terraform_remote_state.global.outputs.mgmtcfglbcnt)
# mgmtcfgsshuser = yamldecode(data.terraform_remote_state.global.outputs.mgmtcfgsshuser)
# ippoolmaster_list = yamldecode(data.terraform_remote_state.global.outputs.ip_pool_policy)
# ippoolworker_list = yamldecode(data.terraform_remote_state.global.outputs.ip_pool_policy)
# kubever_list = yamldecode(data.terraform_remote_state.global.outputs.k8s_version_name)
# infrapolname = yamldecode(data.terraform_remote_state.global.outputs.infrapolname)
# instancetypename = yamldecode(data.terraform_remote_state.global.outputs.instancetypename)
# mastergrpname = yamldecode(data.terraform_remote_state.global.outputs.mastergrpname)
# masterdesiredsize = yamldecode(data.terraform_remote_state.global.outputs.masterdesiredsize)
# masterinfraname = yamldecode(data.terraform_remote_state.global.outputs.masterinfraname)
#}
