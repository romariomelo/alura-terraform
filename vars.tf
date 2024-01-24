variable "amis" {
  type = map(string)

  default = {
    us-east-1 = "ami-0a3c3a20c09d6f377"
    us-east-2 = "ami-024e6efaf93d85776"
  }
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type     = string
  nullable = false
}
