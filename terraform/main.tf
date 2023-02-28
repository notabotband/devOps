terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  token = var.token
  cloud_id = var.cloud_id
  folder_id = var.folder_id
  zone = var.zone
}

resource "yandex_compute_instance" "vm-1" {
  name = var.name

  resources {
    cores = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat = false
  }

  metadata = {
    user-data = "${file("../scripts/add-ssh-web-app.yaml")}"
  }
}

output "ip_address" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}
