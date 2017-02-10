#
# Bastion instance
#
resource "aws_instance" "bastion" {
  ami = "${data.aws_ami.centos7_ami.id}"
  instance_type               = "${var.instance_jump}"
  subnet_id                   = "${data.terraform_remote_state.vpc_rs.public_subnet.0.id}"
  subnet_id                   = "${element(split( ",", data.terraform_remote_state.vpc_rs.public_subnet), 0)}"
  key_name                    = "${var.ssh_key_name}"
  vpc_security_group_ids      = ["${aws_security_group.bastion.id}"]
  user_data                   = "${data.template_file.bastion.rendered}"
  associate_public_ip_address = true
  tags {
    Name  = "bastion-01"
    Owner = "${var.owner}"
  }
}

#
# Output
#
output "bastion_public_ip" {
  value = "${aws_instance.bastion.public_ip}"
}
output "bastion_private_ip" {
  value = "${aws_instance.bastion.private_ip}"
}
