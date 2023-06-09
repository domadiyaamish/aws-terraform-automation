provider "google" {
  credentials = file("gcp-account.json")
  project = "gcp-terraform-307119"
  region = "europe-west4"
  zone = "europe-west-a"
}

resource "google_compute_instance" "default" {
  name = "test"
  machine_type = "ec-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      
    }
  }
}