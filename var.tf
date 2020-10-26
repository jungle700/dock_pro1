variable "aws_region" {
  description = "AWS region to launch servers."
  default = "eu-west-1"

}

variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.8.0.0/16"
}

variable "private_1a_subnet_cidr" {
    description = "CIDR for the Private Subnet"
        default = "10.8.0.0/24"
}


variable "public_1a_subnet_cidr" {
    description = "CIDR for the Public Subnet"
        default = "10.8.1.0/24"
}



variable "amis" {
  type = map(string)
  default = {
    "eu-west-1" = "ami-0b555ffd9b0053e23"
  } 
}

variable "instance_type" {
   default = "t2.micro"
}

variable "aws_key_name" {
   default = "jaye"
}

variable "path_to_public_key" {

  default = "~/devops/terrapro/project2/tkay.pub"
}