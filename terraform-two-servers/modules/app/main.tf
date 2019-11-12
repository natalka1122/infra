resource "google_compute_instance" "app" {
  name         = "reddit-app"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"
  tags         = ["${var.net_tag_app}"]
  boot_disk {
    initialize_params {
      image = "${var.disk_image_app}"
    }
  }
  metadata = {
    sshKeys = "${var.username}:${file(var.key_path_public)}"
  }
  network_interface {
    network = "default"
    access_config {
      nat_ip = "${google_compute_address.app_ip.address}"
    }
  }
  connection {
    type        = "ssh"
    host        = "${google_compute_address.app_ip.address}"
    user        = "${var.username}"
    agent       = "${var.use_ssh_agent}"
    private_key = "${var.key_private}"
  }
  provisioner "file" {
    #source      = "${path.module}/files/puma.service" == somehow it does not work
    content     = "${file("${path.module}/files/puma.service")}" // so I user this replacement
    destination = "/tmp/puma.service"
  }
  provisioner "file" {
    #source      = "${path.module}/files/deploy.sh" == somehow it does not work
    content     = "${file("${path.module}/files/deploy.sh")}" // so I user this replacement
    destination = "/tmp/deploy.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/deploy.sh",
      "/tmp/deploy.sh ${var.db_address}" // workaroud to pass variable as a script parameter
    ]
  }
}
resource "google_compute_address" "app_ip" {
  name = "reddit-app-ip"
}