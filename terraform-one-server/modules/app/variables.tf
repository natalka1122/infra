variable key_path_public {
  description = "Path to the public key used for ssh access"
}
variable key_private {
  description = "Path to the private key used for ssh access"
}
variable "use_ssh_agent" {
  description = "True if ssh-agent is used"
}
variable disk_image_app {
  description = "Disk image"
}
variable machine_type {
  description = "Machine type for instance"
  default     = "g1-small"
}
variable zone {
  description = "Google Cloud zone"
  default     = "europe-west1-b"
}
variable "net-tag-app" {
  description = "Network tag for instance"
  default     = "reddit-app"
}
variable "username" {
  description = "Username for application"
}