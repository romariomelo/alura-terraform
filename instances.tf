resource "aws_instance" "api" {
  count         = 2
  ami           = var.amis["us-east-2"]
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = {
    Name = "dev-${count.index + 1}"
  }
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
}

resource "aws_instance" "dev-instance" {
  ami           = var.amis["us-east-2"]
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = {
    Name = "dev-instance"
  }
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  depends_on             = [aws_s3_bucket.dev-bucket]
}

resource "aws_instance" "dev-instance-us-1" {
  provider      = aws.us-east-1
  ami           = var.amis["us-east-1"]
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = {
    Name = "dev-instance"
  }
  vpc_security_group_ids = [aws_security_group.allow-ssh-us-east-1.id]
  depends_on             = [aws_dynamodb_table.dynamodb]
}
