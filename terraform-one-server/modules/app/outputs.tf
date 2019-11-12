output "app_external_ip" {
  value = "${google_compute_address.app_ip.address}"
}