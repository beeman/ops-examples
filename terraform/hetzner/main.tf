provider "hcloud" {
  # Configuration options
  token = var.token
}

resource "hcloud_server" "node1" {
  name        = "node1"
  image       = "debian-12"
  server_type = "cx22"
  location    = "fsn1"
  user_data   = " ${file("user-config.yaml")}"
}