resource "google_compute_instance" "default" {
  name         = "${random_pet.server.id}-rosettaathome"
  machine_type = var.instance_type
  zone         = var.gcp_zone

  tags = ["mission", "rosetta"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    Mission = "rosetta"
  }

  metadata_startup_script = <<DOTHIS
  sudo apt -y install boinc-client
    systemctl start boinc-client
    sudo apt update && sudo apt install -y unzip jq dnsutils
    sudo boinccmd --project_attach http://boinc.bakerlab.org/rosetta var.boinc_project_id
    #sleep 10
    #sudo boinccmd --project http://boinc.bakerlab.org/rosetta detach
  DOTHIS

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}