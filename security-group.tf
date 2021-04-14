resource "aws_security_group" "terraform-acesso-ssh" {
  name        = "terraform-acesso-ssh"
  description = "terraform-acesso-ssh"

  ingress {
    description = "security group SSH in us-east-2"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cdirs_acesso_remoto
  }

  tags = {
    Name = "terraform-acesso-ssh"
  }

}

resource "aws_security_group" "terraform-acesso-ssh-us-east-1" {
  provider    = aws.east1
  name        = "terraform-acesso-ssh-us-east-1"
  description = "terraform-acesso-ssh-us-east-1"

  ingress {
    description = "security group SSH in us-east-1"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cdirs_acesso_remoto
  }

  tags = {
    Name = "terraform-acesso-ssh"
  }

}
