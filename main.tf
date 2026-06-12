resource "aws_subnet" "public" {
  vpc_id                  = "vpc-00235529d5191284d"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  availability_zone = "us-east-1a"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "vpc-00235529d5191284d"

  tags = {
    Name = "main-igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = "vpc-00235529d5191284d"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "sg" {
  name        = "basic-sg"
  description = "Allow HTTP"
  vpc_id      = "vpc-00235529d5191284d"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "web" {
  ami           = "ami-091138d0f0d41ff90"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public.id

  vpc_security_group_ids = [
    aws_security_group.sg.id
  ]

  user_data     = file("userdata.sh")

  tags = {
    Name = "basic-terra"
  }
}

output "instance_public_ip" {
  value       = aws_instance.web.public_ip
  description = "Website is running on this address:"
}