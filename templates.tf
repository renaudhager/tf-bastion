#
# Templates for mesos master
#
data "template_file" "bastion" {
  template               = "${file("cloudinit/default.yml")}"

  vars {
    hostname             = "bastion-01"
  }
}
