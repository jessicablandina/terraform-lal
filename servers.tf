data "aws_ami" "latest-ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "secondserver" {
  ami           = data.aws_ami.latest-ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "identifiertag"
  }

  subnet_id = aws_subnet.subnet2.id
}


