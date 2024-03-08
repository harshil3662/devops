terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"

  provisioner "local-exec" {
    command = "docker cp ${local_file.dist_files.filename}/. ${docker_container.nginx.name}:/usr/share/nginx/html"
  }

  ports {
    internal = 80
    external = 8080
  }
}

resource "local_file" "dist_files" {
  filename = "${path.module}/dist/main.tf"
  content  = file("${path.module}/../terraform-docker/main.tf")
}