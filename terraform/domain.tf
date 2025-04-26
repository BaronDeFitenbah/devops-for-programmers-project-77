resource "yandex_dns_zone" "main" {
  name        = "main-zone"
  zone        = var.app_domain # Например, "example.com."
  public      = true           # Публичная зона
}

resource "yandex_certificate_manager_certificate" "cert" {
  name    = "terra-le-1"
  domains = [var.app_domain] # Домены для сертификата

  managed {
    challenge_type = "DNS_CNAME" # Тип проверки владения доменом
  }

  depends_on = [yandex_dns_zone.main] # Сертификат зависит от DNS-зоны
}