terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws",
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

provider "aws" {
  region = "us-east-1"
  alias  = "east1"
}

resource "aws_instance" "dev" {
  count         = 3
  ami           = var.amis.us-east-2
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = {
    Name = "dev${count.index}"
  }

  vpc_security_group_ids = [aws_security_group.terraform-acesso-ssh.id]
}

resource "aws_instance" "dev6" {
  provider      = aws.east1
  ami           = var.amis.us-east-1
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = {
    Name = "dev6"
  }

  vpc_security_group_ids = [aws_security_group.terraform-acesso-ssh-us-east-1.id]

  depends_on = [
    aws_dynamodb_table.dynamodb-homologacao
  ]
}

resource "aws_instance" "dev7" {
  ami = var.amis.us-east-2
  instance_type = var.instance_type
  key_name = var.key_name

  tags = {
    Name = "dev7"
  }

  vpc_security_group_ids = [ aws_security_group.terraform-acesso-ssh.id ]
}


resource "aws_dynamodb_table" "dynamodb-homologacao" {
  provider     = aws.east1
  name         = "GameScores"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "UserId"
  range_key    = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }

  tags = {
    Name = "value"
  }
}
