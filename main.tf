


resource "aws_vpc" "firstvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
      Region = "London"
  }
}
