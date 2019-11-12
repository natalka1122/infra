variable "project" {
  description = "Project ID"
}
variable "region" {
  description = "Region"
  default     = "europe-west1"
}
variable "key_path_public" {
  description = "Path to the public key used for ssh access"
}
variable "key_path_private" {
  description = "Path to the private key used for ssh access"
}
variable "use_ssh_agent" {
  description = "True if ssh-agent is used"
}
variable "disk_image_app" {
  description = "Disk image for application instance"
}
variable "disk_image_db" {
  description = "Disk image for database instance"
}
variable "ssh_source_address" {
  description = "Allowed source address for SSH"
  default     = "0.0.0.0/0"
}
variable "username" {
  description = "Username for application"
  default     = "appuser"
}
variable "net_tag_app" {
  description = "Network tag for application instance"
  default     = "reddit-app"
}
variable "net_tag_db" {
  description = "Network tag for database instance"
  default     = "reddit-db"
}