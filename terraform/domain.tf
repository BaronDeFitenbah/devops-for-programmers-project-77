resource "yandex_dns_zone" "main" {
  name        = "main-zone"
  zone        = var.app_domain
  public      = true
}
