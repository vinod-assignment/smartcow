provider "aws" {

  region = us-east-1

}



resource "aws_key_pair" "ssh" {

  key_name   = smartcow

  public_key = file("~/.ssh/id_rsa.pub")

}



resource "aws_security_group" "instance" {

  name_prefix = "instance-sg-"

  vpc_id      = vpc-0a343f61bbebedae2



  ingress {

    from_port   = 0

    to_port     = 65535

    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }



  egress {

    from_port   = 0

    to_port     = 65535

    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

}



resource "aws_instance" "instance" {

  ami           = "ami-0c55b159cbfafe1f0"

  instance_type =  "t2.micro"

  key_name      = aws_key_pair.ssh.key_name

  subnet_id     = subnet-064202dbe3fa572f4

  vpc_security_group_ids = [

    aws_security_group.instance.id,

  ]



  user_data = <<-EOF

              #!/bin/bash

              sudo yum update -y

              sudo amazon-linux-extras install docker

              sudo service docker start

              sudo usermod -a -G docker ec2-user

              sudo chkconfig docker on

output "aws__public_ip" {

  value = aws_.public_ip
