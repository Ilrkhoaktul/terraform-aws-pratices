resource "aws_instance" "ec2" {
  ami           = "ami-0f3a43fbf2d3899f7"
  instance_type = "t2.micro"
  tags = {
    Name = "Public IP"
  }
}

resource "aws_eip" "elastic_ip" {
  instance = "${aws_instance.ec2.id}"
}

output "pulicip" {
  value = "${aws_eip.elastic_ip.public_ip}"
}



