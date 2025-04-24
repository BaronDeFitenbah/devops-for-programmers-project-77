terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "terraform-state-bucket"
    region     = "ru-central1"
    key        = "terraform.tfstate"
    access_key = "YCAJxxxxxxxxxxxxxxxxxxx"
    secret_key = "YCPxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}