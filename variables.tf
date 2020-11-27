variable "hostname" {
  type = string
  description = "hostname for tfe"
  default = "app.terraform.io"
}

variable "token" {
  type = string
  description = "token for tfe organization"
  default = "token"
}

variable "workspace_id" {
  type = string
  description = "workspace for tfe organization"
  default = "workspace"
}

variable "clusterid_val" {
  type = string
  description = "value for clusterid"
  default = "ocp4-9n2nn"
}

variable "clustername_val" {
  type = string
  description = "value for clustername"
  default = "ocp4-lmt"
}

variable "basedomain_val" {
  type = string
  description = "value for basedomain"
  default = "https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest"
}

variable "pullsecret_val" {
  type = string
  description = "value for pullsecret"
  default = ""
}

variable "installerurl_val" {
  type = string
  description = "value for installerurl"
  default = "https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest"
}

variable "awsami_val" {
  type = string
  description = "value for awsami"
  default = "ami-06f85a7940faa3217"
}

variable "awsregion_val" {
  type = string
  description = "value for awsregion"
  default = "us-east-1"
}

variable "publish_val" {
  type = string
  description = "value for publish"
  default = "External"
}

