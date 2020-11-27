# Autor : Luis Merino Troncoso
# fecha : 27/10/20

# Carga de las variables del tfvars a traves del tfe api 

# para restaurar el workspace hace falta borrar lo sigiuiente
# acordarse de borrar 
#   route 53  los A y las hostes zones
#   vpc , security groups ... 
#   ami y los snapshots
#   ALB y target groups
#   NAt y elastic ip
#   IAM roles e instance profiles
#     aws --region=us-east-1 iam delete-instance-profile --instance-profile-name  ocp4-9n2nn-bootstrap-profile
#     aws --region=us-east-1 iam delete-instance-profile --instance-profile-name  ocp4-9n2nn-master-profile
#     aws --region=us-east-1 iam delete-instance-profile --instance-profile-name  ocp4-9n2nn-worker-profile
#   Network interfaces 
#   s3 ignition bucket


terraform {
  required_providers {
    tfe = {
      source = "hashicorp/tfe"
      version = "0.22.0"
    }
  }
}

provider "tfe" {
  hostname = var.hostname
  token    = var.token
  version  = "~> 0.22.0"
}

# En este caso ya tengo organizacion y el workspace 
# creada y no me hace falta.
# solo necesito el workspace_id existente y el token personal generado 

#resource "tfe_organization" "test" {
#  name  = "lmtbelmonte"
#  email = "lmtbelmonte@cloud-bigdata.net"
#}

#resource "tfe_workspace" "tfe-openshift" {
#  name         = "terraform-openshift4-aws"
#  organization = tfe_organization.test.id
#}

resource "tfe_variable" "clusterid" {
  key          = "cluster_id"
  value        = var.clusterid_val
  category     = "terraform"
  sensitive    = "false"
  workspace_id = var.workspace_id
  description  = "Id del cluster OCP "
}

resource "tfe_variable" "clustername" {
  key          = "clustername"
  value        = var.clustername_val
  category     = "terraform"
  sensitive    = "false"
  workspace_id = var.workspace_id
  description  = "Nombre del cluster OCP"
}

resource "tfe_variable" "basedomain" {
  key          = "base_domain"
  value        = var.basedomain_val
  category     = "terraform"
  sensitive    = "false"
  workspace_id = var.workspace_id
  description  = "Dominio del cluster OCP"
}

resource "tfe_variable" "pullsecret" {
  key          = "openshift_pull_secret"
  value        = var.pullsecret_val
  category     = "terraform"
  sensitive    = "false"
  workspace_id = var.workspace_id
  description  = "Pull secret"
}

resource "tfe_variable" "installerurl" {
  key          = "openshift_installer_url"
  value        = var.installerurl_val
  category     = "terraform"
  sensitive    = "false"
  workspace_id = var.workspace_id
  description  = "Url del openshift installer"
}

resource "tfe_variable" "accesskey" {
  key          = "aws_access_key_id"
  value        = var.aws_access_key_id
  category     = "terraform"
  sensitive    = "true"
  workspace_id = var.workspace_id
  description  = "Variable de terraform para aws_access_key_id "
}

resource "tfe_variable" "accesskey-env" {
  key          = "AWS_ACCESS_KEY_ID"
  value        = var.aws_access_key_id
  category     = "env"
  sensitive    = "true"
  workspace_id = var.workspace_id
  description  = "Variable de Entorno para aws_access_key_id"
}

resource "tfe_variable" "secretaccesskey" {
  key          = "aws_secret_access_key"
  value        = var.aws_secret_access_key
  category     = "terraform"
  sensitive    = "true"
  workspace_id = var.workspace_id
  description  = "Variable de terraform para aws_secret_access_key"
}

resource "tfe_variable" "secretaccesskey-env" {
  key          = "AWS_SECRET_ACCESS_KEY"
  value        = var.aws_secret_access_key
  category     = "env"
  sensitive    = "true"
  workspace_id = var.workspace_id
  description  = "Variable de Entorno para aws_secret_access_key"
}


resource "tfe_variable" "awsami" {
  key          = "aws_ami"
  value        = var.awsami_val
  category     = "terraform"
  sensitive    = "false"
  workspace_id = var.workspace_id
  description  = "a useful description"
}

#resource "tfe_variable" "extratags" {
#  key          = "aws_extra_tags"
#  value        = {kubernetes.io/cluster/ocp4-9n2nn = "owned", owner = "admin"}
#  category     = "terraform"
#  sensitive    = "true"
#  hcl          = "true"
#  workspace_id = var.workspace_id
#  description  = "a useful description"
#}

#resource "tfe_variable" "awsazs" {
#  key          = "aws_azs"
#  value        = [ "us-east-1a", "us-east-1b", "us-east-1c" ]
#  category     = "terraform"
#  sensitive    = "false"
#  hcl          = "true"
#  workspace_id = var.workspace_id
#  description  = "a useful description"
#}


resource "tfe_variable" "region" {
  key          = "aws_region"
  value        = var.awsregion_val
  category     = "terraform"
  sensitive    = "false"
  workspace_id = var.workspace_id
  description  = "la region AWS"
}

resource "tfe_variable" "publish_strategy" {
  key          = "aws_publish_strategy"
  value        = var.publish_val
  category     = "terraform"
  sensitive    = "false"
  workspace_id = var.workspace_id
  description  = "Tipo de despliegue si es External, Internal o airgapped"
}
