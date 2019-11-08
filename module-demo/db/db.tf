variable "dbname" {
  type = "string"
}


resource "aws_instance" "dbmodule" {
  ami           = "ami-0f3a43fbf2d3899f7"
  instance_type = "t2.micro"

  tags = {
    Name = "${var.dbname}"
  }
}

output "DB_Private_IP" {
  value = "${aws_instance.dbmodule.private_ip}"
}
