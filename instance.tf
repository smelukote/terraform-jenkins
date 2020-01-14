locals {
  startup_script        = "scripts/startup.sh"
}

resource "google_compute_instance" "default" {
  name         = "jumpbox1"
  machine_type = "n1-standard-1"
  zone         = "us-west1-a"

  tags = ["allow-ssh", "allow-int-http"]

  boot_disk {
    initialize_params {
      image = "ubuntu-1604-xenial-v20200108"
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
    foo = "bar"
  }

 metadata_startup_script = "${file(local.startup_script)}"


  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}