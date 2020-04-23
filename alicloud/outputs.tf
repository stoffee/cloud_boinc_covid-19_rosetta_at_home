output "alicloud_ecs_instance_info" {
  value = <<INSTANCEIP
Your Rosetta@home Alicloud ECS instance has been created
  $ ssh -i ${var.key_pair}  root@${alicloud_instance.website.public_ip}
INSTANCEIP
}