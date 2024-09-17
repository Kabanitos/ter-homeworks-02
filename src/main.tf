resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop_web" {
  name           = var.vm_web_vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_web_default_cidr
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
}
resource "yandex_compute_instance" "platform" {
  name        = var.vm_web_yandex_compute_instance.name
  platform_id = var.vm_web_yandex_compute_instance.platform_id
  resources {
    cores         = var.vm_web_yandex_compute_instance.cores
    memory        = var.vm_web_yandex_compute_instance.memory
    core_fraction = var.vm_web_yandex_compute_instance.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_web_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop_web.id
    nat       = var.vm_web_nat
  }

  metadata = {
    serial-port-enable = var.vm_web_serial-port-enable
    ssh-keys           = "ubuntu:${var.vm_web_vms_ssh_root_key}"
  }

}










resource "yandex_vpc_subnet" "develop_db" {
  name           = var.vm_db_vpc_name
  zone           = var.vm_db_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_db_default_cidr
}


data "yandex_compute_image" "ubuntu_db" {
  family = var.vm_db_family
}
resource "yandex_compute_instance" "platform_db" {
  name        = var.vm_db_yandex_compute_instance.name
  platform_id = var.vm_db_yandex_compute_instance.platform_id
  resources {
    cores         = var.vm_db_yandex_compute_instance.cores
    memory        = var.vm_db_yandex_compute_instance.memory
    core_fraction = var.vm_db_yandex_compute_instance.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_db_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop_db.id
    nat       = var.vm_db_nat
  }

  metadata = {
    serial-port-enable = var.vm_db_serial-port-enable
    ssh-keys           = "ubuntu:${var.vm_db_vms_ssh_root_key}"
  }

}





















