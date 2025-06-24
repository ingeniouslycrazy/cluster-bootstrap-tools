resource "proxmox_vm_qemu" "jump-host" {
  name        = "jump-host"
  desc        = "Jump host to access all nodes around here"
  target_node = "node01"
  clone       = "base"
  full_clone  = true
  vmid        = 101
  cores       = 1
  memory      = 512
  onboot      = true
  vm_state    = "running"
  agent       = 1

  network {
    id        = 0
    bridge    = "vmbr0"
    firewall  = true
    link_down = false
    model     = "virtio"
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      qemu_os,
    ]
  }
}