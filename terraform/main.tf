terraform {
  required_providers {
    cml2 = {
      source = "CiscoDevNet/cml2"
      version = "0.8.5"
    }
  }
}

provider "cml2" {
  # declare environment varibales
  # eg. export TF_VAR_CML_ADDRESS=https://192.0.0.1
  address = var.CML_ADDRESS
  username = var.CML_USERNAME
  password = var.CML_PASSWORD
  skip_verify = true
}

variable "CML_ADDRESS" {
  type = string
}

variable "CML_USERNAME" {
  type = string
}

variable "CML_PASSWORD" {
  type = string
}
