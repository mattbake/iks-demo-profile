# locals {
#   organization= yamldecode(data.terraform_remote_state.global.outputs.organization)
#   ippool_list = yamldecode(data.terraform_remote_state.global.outputs.ip_pool_policy)
#   netcfg_list = yamldecode(data.terraform_remote_state.global.outputs.network_pod)
#   syscfg_list = yamldecode(data.terraform_remote_state.global.outputs.network_service)
#   clustername = yamldecode(data.terraform_remote_state.global.outputs.clustername)
#   mgmtcfgetcd = yamldecode(data.terraform_remote_state.global.outputs.mgmtcfgetcd)
#   mgmtcfglbcnt = yamldecode(data.terraform_remote_state.global.outputs.mgmtcfglbcnt)
#   mgmtcfgsshuser = yamldecode(data.terraform_remote_state.global.outputs.mgmtcfgsshuser)
#   ippoolmaster_list = yamldecode(data.terraform_remote_state.global.outputs.ip_pool_policy)
#   ippoolworker_list = yamldecode(data.terraform_remote_state.global.outputs.ip_pool_policy)
#   kubever_list = yamldecode(data.terraform_remote_state.global.outputs.k8s_version_name)
#   infrapolname = yamldecode(data.terraform_remote_state.global.outputs.infrapolname)
#   instancetypename = yamldecode(data.terraform_remote_state.global.outputs.instancetypename)
#   mastergrpname = yamldecode(data.terraform_remote_state.global.outputs.mastergrpname)
#   masterdesiredsize = yamldecode(data.terraform_remote_state.global.outputs.masterdesiredsize)
#   masterinfraname = yamldecode(data.terraform_remote_state.global.outputs.masterinfraname)
# }