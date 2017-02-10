#
# ROUTE 53
#
resource "aws_route53_record" "bastion" {
  zone_id = "${data.terraform_remote_state.vpc_rs.default_route53_zone}"
  name    = "bastion-01"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.bastion.*.private_ip}"]
}
