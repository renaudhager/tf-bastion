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

variable "azs" {
  default = {
    "eu-west-1"      = "a,b,c"
    "eu-central-1"   = "a,b"
    "us-east-1"      = "a,b,c"
    "us-east-2"      = "a,b,c"
    "us-west-1"      = "a,c"
    "us-west-2"      = "b,c"
    "ap-southeast-2" = "a,b,c"
  }
}
