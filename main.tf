resource "aws_instance" "ec2" {
   
    ami = var.ec2-ubuntu-ami
    instance_type = "t2.micro"
    tags = {
      Name = "terraform-server"

    }
    key_name = aws_key_pair.key.key_name

    security_groups = [aws_security_group.allow_ssh.name]

}

resource "aws_key_pair" "key" {
  key_name = "id_rsa"
  public_key = file("~/ .ssh/id_rsa.pub")
    
}

resource "aws_default_vpc" "default_vpc" {

 }

resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh"
  description = "allow ssh inbound traffic"
  

  #using default vpc

  vpc_id = aws_default_vpc.default_vpc.id
  ingress {

    description = "TLS from vpc"

    #we should allow incoming and outgoing traffic

    from_port = 22
    to_port = 22
    protocol = "tcp"

    #allow all traffic
    cidr_blocks = ["0.0.0.0/0"]


  }
  tags = {
    Name = "allow ssh"
  }
}

