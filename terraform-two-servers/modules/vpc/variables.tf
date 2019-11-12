variable ssh_source_range {
  description = "Allowed IP addresses"
  default     = "0.0.0.0/0"
}
variable "net_tag_db" {
  description = "Network tag for db instance"
}
variable "net_tag_app" {
  description = "Network tag for app instance"
}