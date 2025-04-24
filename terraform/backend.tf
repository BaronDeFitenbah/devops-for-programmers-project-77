terraform {
  cloud {
    organization = "vladislav"

    workspaces {
      name = "hexlet"
    }
  }
}