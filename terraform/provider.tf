terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.85.0" # Убедитесь, что используете актуальную версию провайдера
    }
  }
}

# Провайдер Yandex Cloud
provider "yandex" {
  token     = var.yc_oauth_token   # OAuth-токен для доступа к Yandex Cloud
  cloud_id  = var.yc_cloud_id      # ID облака
  folder_id = var.yc_folder_id     # ID каталога
  zone      = var.yc_default_zone  # Зона доступности по умолчанию
}

provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
  api_url = "https://${var.datadog_domain}/"
}