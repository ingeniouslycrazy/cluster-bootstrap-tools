terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.78.2"
    }
  }
  backend "local" {
    path = "/srv/terraform.tfstate"
  }
}

provider "proxmox" {
  # Configuration options
}