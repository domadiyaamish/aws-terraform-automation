provider "aws" {
  region = ""
  access_key = ""
  secret_key = ""
}

module "webserver-1" {
  source = ".//module-1"
}

module "webserver-2" {
  source = ".//module-2"
}