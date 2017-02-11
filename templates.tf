#
# Templates for mesos master
#
data "template_file" "bastion" {
  template               = "${file("cloudinit/default.yml")}"

  vars {
    hostname             = "bastion-01"
    puppet_agent_version = "${var.puppet_agent_version}"
    puppet_server        = "${var.puppet_server_hostname}"
    tld                  = "${var.tld}"
  }
}
