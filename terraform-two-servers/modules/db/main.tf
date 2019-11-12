resource "google_compute_instance" "db" {
  name         = "reddit-db"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"
  tags         = ["${var.net_tag_db}"]
  boot_disk {
    initialize_params {
      image = "${var.disk_image_db}"
    }
  }
  metadata = {
    sshKeys = "${var.username}:${file(var.key_path_public)}"
  }
  network_interface {
    network = "default"
  }
}