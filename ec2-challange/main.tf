resource "aws_instance" "db" {
  ami           = "ami-0f3a43fbf2d3899f7"
  instance_type = "t2.micro"

  tags = {
    Name = "DB"
  }
}

resource "aws_instance" "web" {
  ami             = "ami-0f3a43fbf2d3899f7"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.web_sg.name}"]
  user_data       = "${file("server-script.sh")}"
  tags = {
    Name = "Web"
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
  instance = "${aws_instance.web.id}"
}

output "DB_Private_IP" {
  value = "${aws_instance.db.private_ip}"
}
output "Web_Public_IP" {
  value = "${aws_eip.web_ip.public_ip}"
}

