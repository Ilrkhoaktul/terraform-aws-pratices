variable "webname" {
  type = "string"
}

resource "aws_instance" "webmodule" {
  ami             = "ami-0f3a43fbf2d3899f7"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.web_sg.name}"]
  user_data       = "${file("./web/server-script.sh")}"
  tags = {
    Name = "${var.webname}"
  }
}


resource "aws_security_group" "web_sg" {
  ingress {
    to_port     = 80
    from_port   = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    to_port     = 80
    from_port   = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    to_port     = 443
    from_port   = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    to_port     = 443
    from_port   = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_eip" "web_ip" {
  instance = "${aws_instance.webmodule.id}"
}


output "Web_Public_IP" {
  value = "${aws_eip.web_ip.public_ip}"
}

