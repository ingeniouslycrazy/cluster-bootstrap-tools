group "default" {
  targets = ["base", "ansible", "terraform"]
}

target "base" {
  context = "."
  dockerfile = "./oci/base/Dockerfile"
  tags = ["ingeniouslycrazy/base:latest"]
}

target "ansible" {
  context = "."
  dockerfile = "./oci/ansible/Dockerfile"
  tags = ["ingeniouslycrazy/ansible:latest"]
  inherits = ["base"]
}

target "terraform" {
  context = "."
  dockerfile = "./oci/hashicorp/Dockerfile"
  args = {
    PRODUCT = "terraform"
    VERSION = "1.12.2"
  }
  tags = [
    "ingeniouslycrazy/terraform:latest",
    "ingeniouslycrazy/terraform:1.12.2"
  ]
  inherits = ["base"]
}

target "clt" {
  context = "."
  dockerfile = "./oci/clt/Dockerfile"
  args = {
    TERRAFORM_VERSION = "1.12.2"
  }
  tags = [
    "ingeniouslycrazy/bootstrap-clt:latest",
    "ingeniouslycrazy/bootstrap-clt:1.0.0"
  ]
  inherits = ["base"]
}