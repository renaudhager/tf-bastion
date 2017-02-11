#
# AWS Provisioning
#
variable "access_key"   {}
variable "secret_key"   {}
variable "owner"        { default = "r.hager" }
variable "tld"          { default = "ue2.aws" }
variable "region"       { default = "us-east-2" }
variable "ssh_key_name" {}

#
# Remote state files defintion
#
variable "vpc_rs_bucket" {}
variable "vpc_rs_key"    {}

#
# Instances stuff
#
variable "instance_jump" { default = "t2.nano" }

#
# Puppet stuff
#
variable "puppet_agent_version"      { default = "1.7.1" }
variable "puppet_server_hostname"    { default = "puppetca-01" }
