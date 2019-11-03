resource "google_compute_instance" "app" {
  name         = "reddit-app"
  machine_type = "${var.machine_type_app}"
  zone         = "${var.region}"
  tags         = ["${var.tag_app}"]
  boot_disk {
    initialize_params {
      image = "${var.disk_image_app}"
    }
  }
  # определение сетевого интерфейса
  network_interface {
    # сеть, к которой присоединить данный интерфейс
    network = "default"
    access_config {
      nat_ip = "${google_compute_address.app_ip.address}"
    }
  }
  metadata = {
    ssh-keys = "${var.username}:${file(var.key_path_public)}"
  }
  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }
  provisioner "remote-exec" {
    inline = [
      "curl https://raw.githubusercontent.com/natalka1122/infra/master/config-scripts/deploy.sh | sudo -u appuser -H -i bash",
      "curl https://raw.githubusercontent.com/natalka1122/infra/master/config-scripts/install_service.sh | sudo bash"
    ]
    #scripts = ["files/deploy.sh","files/install_service.sh"]
  }
}
resource "google_compute_address" "app_ip" {
  name = "reddit-app-ip"
}
resource "google_compute_firewall" "firewall_puma" {
  name    = "allow-puma-default"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["${var.port_app}"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["${var.tag_app}"]
}