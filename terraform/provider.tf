terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.85.0" # Убедитесь, что используете актуальную версию провайдера
    }
    datadog = {
      source  = "DataDog/datadog"
      version = "~> 3.0"
    }
  }
}

# Провайдер Yandex Cloud
provider "yandex" {
  token     = var.yc_oauth_token
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
  zone      = var.yc_default_zone
}

provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
  api_url = "https://${var.datadog_domain}/"
}