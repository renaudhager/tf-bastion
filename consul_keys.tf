#
# Consul key for FQDN
#
resource "consul_keys" "bastion-01" {
    datacenter = "${data.terraform_remote_state.vpc_rs.vdc}"

    # Create the entry for DNS
    key {
        path = "${data.terraform_remote_state.vpc_rs.vdc}/fqdn/ue2.lan/bastion-01.ue2.lan"
        value = "${aws_instance.bastion.private_ip}"
        delete = true
    }
}

#
# Consul key for signing in Puppet
#
resource "consul_keys" "bastion-01_signing" {
    datacenter = "${data.terraform_remote_state.vpc_rs.vdc}"

    # Set signing key
    key {
        path   = "${data.terraform_remote_state.vpc_rs.vdc}/signed/bastion-01.${var.tld}"
        value  = "true"
        delete = true
    }
}
