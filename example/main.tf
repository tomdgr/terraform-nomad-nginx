resource "nomad_job" "nginx_image" {
  jobspec = file("${path.module}/conf/nomad/build_image.hcl")
  detach  = false
}


provider "nomad" {
  address = "http://127.0.0.1:4646"
}