resource "google_compute_instance" "db" {
  name         = "reddit-db"
  machine_type = "${var.machine_type_db}"
  zone         = "${var.region}"
  tags         = ["${var.tag_db}"]
  boot_disk {
    initialize_params {
      image = "${var.disk_image_db}"
    }
  }
  network_interface {
    network = "default"
    access_config {}
  }
  metadata = {
    sshKeys = "${var.username}:${file(var.key_path_public)}"
  }
}
resource "google_compute_firewall" "firewall_mongo" {
  name    = "allow-mongo-default"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["${var.port_db}"]
  }
  target_tags = ["${var.tag_db}"]
  source_tags = ["${var.tag_app}"]
}