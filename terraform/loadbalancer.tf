resource "yandex_lb_target_group" "target_group" {
  name      = "hexlet-target-group"
  region_id = var.yc_default_zone

  target {
    address = yandex_compute_instance.vm_1.network_interface.0.ip_address
  }
}

resource "yandex_lb_network_load_balancer" "lb" {
  name = "hexlet-load-balancer"

  listener {
    name        = "http-listener"
    port        = 80
    target_port = 80
    protocol    = "tcp"
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.target_group.id

    healthcheck {
      name = "http-healthcheck"
      http_options {
        port = 80
        path = "/"
      }
    }
  }

  labels = {
    project = "hexlet-terraform-03"
    environment = "Development"
  }
}