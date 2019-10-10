resource "aws_subnet" "subnet1" {
  cidr_block        = "${cidrsubnet(aws_vpc.environment-example-two.cidr_block, 4, 1)}"
  vpc_id            = "${aws_vpc.environment-example-two.id}"
  availability_zone = "us-west-2a"
}

resource "aws_subnet" "subnet2" {
  cidr_block        = "${cidrsubnet(aws_vpc.environment-example-two.cidr_block, 2, 2)}"
  vpc_id            = "${aws_vpc.environment-example-two.id}"
  availability_zone = "us-west-2b"
}

resource "aws_security_group" "subnetsecurity" {
  vpc_id = aws_vpc.environment-example-two.id

  ingress {
    cidr_blocks = [
      aws_vpc.environment-example-two.cidr_block
    ]
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
  }
}
