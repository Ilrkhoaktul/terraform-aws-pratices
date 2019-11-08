resource "aws_instance" "ec2" {
  ami           = "ami-0f3a43fbf2d3899f7"
  instance_type = "t2.micro"

  count = 3
 
}

