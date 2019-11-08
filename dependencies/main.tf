resource "aws_instance" "web" {
  ami           = "ami-0f3a43fbf2d3899f7"
  instance_type = "t2.micro"

  tags = {
    Name = "Web Server"
  }

  depends_on = ["aws_instance.db"]
}


resource "aws_instance" "db" {
  ami           = "ami-0f3a43fbf2d3899f7"
  instance_type = "t2.micro"

  tags = {
    Name = "Db Server"
  }
}
