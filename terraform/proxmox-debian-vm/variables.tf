variable "endpoint" {
  description = "The endpoint of the proxmox server"
}

variable "username" {
  description = "The username of the proxmox root user"
}

variable "password" {
  description = "The password of the proxmox root user"
  sensitive   = true
}

variable "hostname" {
  description = "The hostname of the vm"
  default     = "debian"
}

variable "ssh_public_key" {
  description = "The local path to the public ssh key"
  sensitive   = true
}

variable "target_node" {
  description = "The target node to deploy the vm to"
  default     = "pve"
}

variable "user_config_file" {
  description = "The local path to the user config file"
  default     = "config/user-config.yml"
}

variable "image_datastore_id" {
  description = "The datastore id of the image"
  default     = "local"
}

variable "image_file_name" {
  description = "The name of the image file"
  default     = "debian-12-generic-amd64.qcow2.img"
}

variable "image_url" {
  description = "The url of the image file"
  default     = "https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.qcow2"
}

variable "user_config_datastore_id" {
  description = "The datastore id of the user config"
  default     = "snippets"
}

variable "vm_disk_size" {
  description = "The size of the vm disk"
  default     = 10
}

variable "vm_memory" {
  description = "The memory of the vm"
  default     = 1024
}
variable "vm_cpus" {
  description = "The cpus of the vm"
  default     = 1
}