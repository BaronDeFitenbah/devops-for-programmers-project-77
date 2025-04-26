resource "yandex_vpc_network" "network" {
  name        = "hexlet-terraform-network"
  description = "VPC network for the Hexlet Terraform project"
  labels = {
    project     = "hexlet-terraform-03"
    environment = "Development"
  }
}

resource "yandex_vpc_subnet" "subnet" {
  name           = "hexlet-terraform-subnet"
  zone           = var.yc_default_zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["10.0.0.0/24"]
  labels = {
    project     = "hexlet-terraform-03"
    environment = "Development"
  }
}

resource "yandex_compute_instance" "vm_1" {
  name        = "hexlet-vm-1"
  platform_id = "standard-v1"
  zone        = var.yc_default_zone

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd87kbts71j5********"
      size     = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_public_key}"
  }

  labels = {
    project     = "hexlet-terraform-03"
    environment = "Development"
  }
}

resource "yandex_compute_instance" "vm_2" {
  name        = "hexlet-vm-2"
  platform_id = "standard-v1"
  zone        = var.yc_default_zone

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd87kbts71j5********"
      size     = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_public_key}"
  }

  labels = {
    project     = "hexlet-terraform-03"
    environment = "Development"
  }
}
