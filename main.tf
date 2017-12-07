resource "digitalocean_droplet" "master" {
    image               = "${var.image_slug}"
    name                = "${var.project}-master"
    region              = "${var.region}"
    size                = "${var.image_size}"
    private_networking  = true
    ssh_keys            = ["${split(",",var.keys)}"]
    user_data          = "${data.template_file.user_data.rendered}"



    connection {
       user        = "root"
       type        = "ssh"
       private_key = "${var.private_key_path}"
       timeout     = "2m"
     }
}

# Passing in user-data to set up Ansible user for configuration
data "template_file" "user_data" {
  template = "${file("${path.root}/config/cloud-config.yaml")}"

     vars {
       public_key = "${var.public_key}"
     }
    }
}


resource "digitalocean_droplet" "node" {
    image               = "${var.image_slug}"
    name                = "${var.project}-node-${count.index +1}"
    region              = "${var.region}"
    size                = "${var.image_size}"
    private_networking  = true
    ssh_keys            = ["${split(",",var.keys)}"]
    user_data          = "${data.template_file.user_data.rendered}"



    connection {
       user        = "root"
       type        = "ssh"
       private_key = "${var.private_key_path}"
       timeout     = "2m"
     }
}

# Passing in user-data to set up Ansible user for configuration
data "template_file" "user_data" {
  template = "${file("${path.root}/config/cloud-config.yaml")}"

     vars {
       public_key = "${var.public_key}"
     }
    }
}

