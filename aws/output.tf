output "instance_ip_addr" {
  value = aws_instance.rosettaathome.public_ip
}

output "instance_login_information" {
  value = <<INSTANCEIP

Your Rosetta@home AWS instance has been created
  $ ssh -i aws-ssh-key.pem ubuntu@${aws_instance.rosettaathome.public_ip}

INSTANCEIP
}