variable "servers" {
  type = "list"
}


resource "aws_instance" "ec2" {
  ami                         = "ami-0f3a43fbf2d3899f7"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  count                       = "${length(var.servers)}"
  tags = {
    Name = "${var.servers[count.index]}"
  }

}

output "public_ip" {
  value = ["${aws_instance.ec2.*.public_ip}"]
}

