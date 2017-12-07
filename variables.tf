variable "do_token" {}
variable "project" {}
variable "region" {}
variable "image_slug" {
  type    = "string"
  default = "centos7"
}
variable "image_size" {}
variable "keys" {}
variable "private_key_path" {}
variable "ssh_fingerprint" {}
variable "public_key" {}

