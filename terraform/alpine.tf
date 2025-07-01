data "local_file" "ssh_public_key" {
  filename = "/srv/secrets/ansible_id_rsa.pub"
}

resource "proxmox_virtual_environment_download_file" "ubuntu_cloud_image" {
  content_type       = "iso"
  datastore_id       = "local"
  file_name          = "noble-server-cloudimg-amd64.img"
  node_name          = "node01"
  url                = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
  checksum           = "de55990c985b25704c1daf8a55aed45b"
  checksum_algorithm = "md5"
  verify             = false
}