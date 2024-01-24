data "http" "myip" {
  url    = "https://ipv4.icanhazip.com"
  method = "GET"
  lifecycle {
    postcondition {
      condition     = contains([200], self.status_code)
      error_message = "Failed to get my IP"
    }
  }
}

resource "aws_security_group" "allow-ssh" {
  name        = "allow-ssh"
  description = "allow-ssh"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  }

  tags = {
    Name = "allow-ssh"
  }
}

resource "aws_security_group" "allow-ssh-us-east-1" {
  provider    = aws.us-east-1
  name        = "allow-ssh"
  description = "allow-ssh"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  }

  tags = {
    Name = "allow-ssh"
  }
}
