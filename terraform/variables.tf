variable key_path_public {
  description = "Path to the public key used for ssh access"
}
variable key_path_private {
  description = "Path to the private key used for ssh access"
}
variable project {
  description = "Project ID"
}
variable region {
  description = "Region"
  default     = "europe-west1-b"
}
variable disk_image_app {
  description = "Disk image for reddit app"
}
variable disk_image_db {
  description = "Disk image for reddit db"
}
variable port_db {
  description = "Port number for mongodb"
  default     = "27017"
}
variable port_app {
  description = "Port number for application"
  default     = "9292"
}
variable tag_db {
  description = "Network tag for db server"
  default     = "reddit-db"
}
variable tag_app {
  description = "Network tag for app server"
  default     = "reddit-app"
}
variable username {
  description = "Username to start the application"
  default     = "appuser"
}
variable "machine_type_app" {
  description = "GCP machine type for application"
  default     = "g1-small"
}
variable "machine_type_db" {
  description = "GCP machine type for database"
  default     = "g1-small"
}