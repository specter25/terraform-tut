variable "aws_key_pair" {
  default = "~/aws/aws_keys/default-ec2.pem"
}

provider "aws" {
  region  = "us-east-1"
  version = "~> 2.46"
}

# http server security group , expose 80 tcp for http , 22 tcp for ssh and cidr(ip address allowed)["0.0.0.0/0"]
resource "aws_security_group" "http-server-sg" {
  name   = "http_server_sg"
  vpc_id = "vpc-9f3fd6e2"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    name = "http-server-sg"
  }
}

resource "aws_instance" "http_server" {
  ami                    = "ami-02354e95b39ca8dec"
  key_name               = "default-ec2"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.http-server-sg.id]
  subnet_id              = "subnet-06ac7727"

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file(var.aws_key_pair)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo service httpd start",
      "echo Welcome to virtual service ${self.public_dns} | sudo tee /var/www/html/index.html"
    ]
  }

}