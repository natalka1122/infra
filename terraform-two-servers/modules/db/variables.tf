variable key_path_public {
  description = "Path to the public key used for ssh access"
}
variable disk_image_db {
  description = "Disk image"
}
variable machine_type {
  description = "Machine type for db instance"
  default     = "g1-small"
}
variable zone {
  description = "Google Cloud zone"
  default     = "europe-west1-b"
}
variable "net_tag_db" {
  description = "Network tag for db instance"
}
variable "username" {
  description = "Username for application"
}