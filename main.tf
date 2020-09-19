variable "heroku_email" {
  type = string
}

variable "heroku_api_key" {
  type = string
}

variable "heroku_app_name" {
  type = string
}

variable "heroku_region" {
  type = string
  default = "us"
}

terraform {
  required_providers {
    heroku = {
      source = "heroku/heroku"
      version = "2.6.1"
    }
  }
}

provider "heroku" {
  email   = var.heroku_email
  api_key = var.heroku_api_key
}

resource "heroku_app" "application" {
  name   = var.heroku_app_name
  region = var.heroku_region

  config_vars = {
    NODE_ENV = "production"
  }
}

resource "heroku_build" "application" {
  app = heroku_app.application.name
  buildpacks = ["https://github.com/heroku/heroku-buildpack-nodejs.git"]

  source = {
    path = "application/"
  }
}

resource "heroku_addon" "database" {
  app = heroku_app.application.name
  plan = "heroku-postgresql:hobby-dev"
}

output "application_url" {
  value = "https://${heroku_app.application.name}.herokuapp.com"
}
