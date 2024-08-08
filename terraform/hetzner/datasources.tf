# data "hcloud_images" "hetzner_images" {
#   with_architecture = ["x86"]
# }
#
# output "hetzner_images" {
#   value = [for image in data.hcloud_images.hetzner_images.images : "${image.name} (${image.id})"]
# }
#
