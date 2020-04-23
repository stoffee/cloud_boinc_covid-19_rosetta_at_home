data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "rosettaathome" {
 ami =  data.aws_ami.ubuntu.id

   instance_type = var.instance_type

  key_name = var.ssh_key_name

  tags = {
    Name = random_pet.server.id
    Owner = "chrisd"
    TTL   = "24hrs"
  }
  user_data = data.template_file.cloud-init.rendered
}

data "template_file" "cloud-init" {
  template = file("cloud-init.tpl")

  vars = {
    boinc_project_id = var.boinc_project_id
  }
}