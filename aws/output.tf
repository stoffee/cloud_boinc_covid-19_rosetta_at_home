output "aws_instance_login_information" {
  value = <<INSTANCEIP

Your Rosetta@home AWS instance has been created
  $ ssh -i ${var.ssh_key_name}.pem ubuntu@${aws_instance.rosettaathome.public_ip}

INSTANCEIP
}