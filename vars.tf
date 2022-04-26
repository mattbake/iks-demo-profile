#variable definitions
variable "api_key" {
  type        = string
  description = "API Key"
}
variable "secretkey" {
  type        = string
  description = "Secret Key"
}
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
  default = "1"
}
variable "masterinfraname" {
  type = string
}
variable "mastermaxsize" {
  type = string
  default = "10"
}
variable "masterminsize" {
  type = string
  default = "1"
}
