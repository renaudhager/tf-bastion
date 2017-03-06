###############################
# Security groups Definitions #
###############################

# Security group for access to Bastion
resource "aws_security_group" "bastion" {
  name        = "${var.owner}_bastion"
  description = "Allow all inbound traffic to bastion"
  vpc_id      = "${data.terraform_remote_state.vpc_rs.vpc}"

  # Allow SSH remote acces
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow consul traffic
  ingress {
    from_port   = 8500
    to_port     = 8500
    protocol    = "tcp"
    cidr_blocks = ["${data.terraform_remote_state.vpc_rs.vpc_cidr_block}"]
  }

  ingress {
    from_port   = 8400
    to_port     = 8400
    protocol    = "tcp"
    cidr_blocks = ["${data.terraform_remote_state.vpc_rs.vpc_cidr_block}"]
  }

  ingress {
    from_port   = 8400
    to_port     = 8400
    protocol    = "tcp"
    cidr_blocks = ["${data.terraform_remote_state.vpc_rs.vpc_cidr_block}"]
  }

  ingress {
    from_port   = 8300
    to_port     = 8305
    protocol    = "tcp"
    cidr_blocks = ["${data.terraform_remote_state.vpc_rs.vpc_cidr_block}"]
  }

  # Allow ICMP traffic
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["${data.terraform_remote_state.vpc_rs.vpc_cidr_block}"]
  }

  # Allow outgoing traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name  = "${var.owner}_bastion"
    owner = "${var.owner}"
  }
}

#
# Outputs
#

output "sg_bastion" {
  value = "${aws_security_group.bastion.id}"
}
