provisioners "file" {
    source = " ${path.module}/engine-config.yml"
    destination = "/home/ubuntu/engine-config.yml"
    connection {
        type = "ssh"
        user = "ubuntu"
        private_key = file("${path.module}/${var.keypair_name}")
        host = self.public_ip
    }
}