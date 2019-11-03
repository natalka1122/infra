provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
}
resource "google_compute_instance" "app" {
  name         = "reddit-app"
  machine_type = "g1-small"
  zone         = "europe-west1-b"
  tags         = ["reddit-app"]
  # определение загрузочного диска
  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
    }
  }
  # определение сетевого интерфейса
  network_interface {
    # сеть, к которой присоединить данный интерфейс
    network = "default"
    # использовать ephemeral IP для доступа из Интернет
    access_config {}
  }
  metadata = {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }
  connection {
    type        = "ssh"
    host        = self.network_interface.0.access_config.0.nat_ip
    user        = "appuser"
    private_key = "${file(var.private_key_path)}"
    agent       = false
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
resource "google_compute_firewall" "firewall_puma" {
  name = "allow-puma-default"
  # Название сети, в которой действует правило
  network = "default"
  # Какой доступ разрешить
  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }
  # Каким адресам разрешаем доступ
  source_ranges = ["0.0.0.0/0"]
  # Правило применимо для инстансов с тегом …
  target_tags = ["reddit-app"]
}