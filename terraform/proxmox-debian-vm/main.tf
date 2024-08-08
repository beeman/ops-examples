provider "proxmox" {
  endpoint = var.endpoint
  username = var.username
  password = var.password
  insecure = true

  ssh {
    agent = true
  }
}

data "local_file" "ssh_public_key" {
  filename = var.ssh_public_key
}

resource "proxmox_virtual_environment_vm" "debian_vm" {
  name      = var.hostname
  node_name = var.target_node
  vm_id     = 1000

  memory {
    dedicated = var.vm_memory
  }

  cpu {
    cores = var.vm_cpus
    type  = "host"
  }

  agent {
    enabled = true
  }

  operating_system {
    type = "l26"
  }

  initialization {

    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    user_data_file_id = proxmox_virtual_environment_file.user_config.id
  }

  disk {
    datastore_id = "local-lvm"
    file_id      = proxmox_virtual_environment_download_file.image.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = var.vm_disk_size
  }

  network_device {
    bridge = "vmbr0"
  }

}

resource "proxmox_virtual_environment_download_file" "image" {
  content_type = "iso"
  datastore_id = var.image_datastore_id
  file_name    = var.image_file_name
  node_name    = var.target_node
  url          = var.image_url
}

resource "proxmox_virtual_environment_file" "user_config" {
  content_type = "snippets"
  datastore_id = var.user_config_datastore_id
  node_name    = var.target_node

  source_raw {
    data      = file(var.user_config_file)
    file_name = "${var.hostname}-user-config.yml"
  }
}
