variable "amis" {
  type = map(any)

  default = {
    "us-east-2" = "ami-01e7ca2ef94a0ae86"
    "us-east-1" = "ami-0742b4e673072066f"
  }
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "cdirs_acesso_remoto" {
  type = list(any)

  default = ["186.220.199.141/32"]
}

variable "key_name" {
  type = string

  default = "terraform-aws"
}