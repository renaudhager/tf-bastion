# Remote State of Core module
data "terraform_remote_state" "vpc_rs" {
    backend = "s3"
    config {
        bucket = "${var.vpc_rs_bucket}"
        key    = "${var.vpc_rs_key}"
        region = "${var.region}"
    }
}
