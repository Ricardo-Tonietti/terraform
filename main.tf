terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-03f65b8614a860c29"
  instance_type = "t2.micro"
  subnet_id = "subnet-0703c6eb7658c743d"
  key_name = "iac-rictonietti"
  user_data = <<-EOF
            #!/bin/bash
            cd /home/ubuntu
            echo "<h1>Feito com terraform</h1>" > index.html
            nohup busybox httpd -f -p 8080 &
            EOF


  tags = {
    Name = "teste AWS"
  }
}